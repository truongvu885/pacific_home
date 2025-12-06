/**
 * File: client/custom/src/views/product/phone-call.js
 * View xử lý click-to-call trên phone field của Product
 */

define('custom:views/product/phone-call', ['views/record/detail', 'custom:views/call/call-history'], function (Dep, CallHistory) {

    return Dep.extend({

        events: _.extend(Dep.prototype.events || {}, {
            'click [data-action="makeCall"]': function (e) {
                e.preventDefault();
                const phoneNumber = $(e.currentTarget).data('phone');
                this.makeCall(phoneNumber);
            },
            'click [data-action="showCallHistory"]': function (e) {
                e.preventDefault();
                this.showCallHistory();
            }
        }),

        setup: function () {
            Dep.prototype.setup.call(this);
            this.callioEnabled = false;
            this.checkCallioStatus();
        },

        checkCallioStatus: function () {
            return Espo.Ajax.getRequest('CallioCall/action/configStatus')
                .then(response => {
                    if (response.success && response.data) {
                        this.callioEnabled = response.data.enabled;
                        this.callioConfigured = response.data.configured;
                    }
                })
                .catch(error => {
                    console.log('Callio status check error:', error);
                    this.callioEnabled = false;
                });
        },

        /**
         * Thực hiện cuộc gọi
         */
        makeCall: function (phoneNumber) {
            if (!this.callioEnabled || !this.callioConfigured) {
                Espo.Ui.error(this.translate('Callio is not configured', 'messages', 'Callio'));
                return;
            }

            if (!phoneNumber) {
                Espo.Ui.error(this.translate('Phone number is required', 'messages'));
                return;
            }

            Espo.Ui.notify(this.translate('Initiating call...'));

            const productId = this.model.id;
            const productName = this.model.get('name');

            Espo.Ajax.postRequest('CallioCall/action/initiate', {
                phoneNumber: phoneNumber,
                entityType: 'Product',
                recordId: productId,
                additionalData: {
                    productName: productName
                }
            })
                .then(response => {
                    if (response.success) {
                        Espo.Ui.success(this.translate('Call initiated successfully'));
                        
                        // Show call history after a short delay
                        setTimeout(() => {
                            this.showCallHistory();
                        }, 1000);
                    } else {
                        Espo.Ui.error(response.error || this.translate('Failed to initiate call'));
                    }
                })
                .catch(error => {
                    Espo.Ui.error(this.translate('Error calling Callio'));
                    console.error('Call error:', error);
                });
        },

        /**
         * Hiển thị lịch sử cuộc gọi
         */
        showCallHistory: function () {
            const phoneNumber = this.model.get('phoneNumber');
            if (!phoneNumber) {
                Espo.Ui.error(this.translate('No phone number found'));
                return;
            }

            const dlgName = 'callio-call-history-' + this.model.id;
            
            if (this.hasView(dlgName)) {
                this.getView(dlgName).remove();
            }

            const view = new CallHistory({
                model: this.model,
                entityType: this.model.name,
                entityId: this.model.id
            });

            this.setView(dlgName, view);
            view.render();
        }
    });
});
