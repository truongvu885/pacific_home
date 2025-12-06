/**
 * File: client/custom/src/views/fields/product-phone-number.js
 * Custom field view cho phone number trên Product
 */

define('custom:views/fields/product-phone-number', ['views/fields/varchar'], function (Dep) {

    return Dep.extend({

        template: 'custom:fields/product-phone-number',

        events: _.extend(Dep.prototype.events || {}, {
            'click [data-action="makeCall"]': function (e) {
                e.preventDefault();
                this.makeCall();
            },
            'click [data-action="showCallHistory"]': function (e) {
                e.preventDefault();
                this.showCallHistory();
            }
        }),

        setup: function () {
            Dep.prototype.setup.call(this);
            
            this.callioEnabled = false;
            this.callioConfigured = false;
            
            this.checkCallioStatus();
        },

        checkCallioStatus: function () {
            console.log("test config 123");
            
            return Espo.Ajax.getRequest('CallioCall/action/configStatus')
                .then(response => {
                    if (response.success && response.data) {
                        this.callioEnabled = response.data.enabled;
                        this.callioConfigured = response.data.configured;
                    }
                })
                .catch(error => {
                    console.log('Callio status check error:', error);
                })
                .then(() => this.reRender());;
        },

        data: function () {
            return {
                value: this.model.get(this.name),
                callioEnabled: this.callioEnabled && this.callioConfigured
            };
        },

        /**
         * Thực hiện cuộc gọi
         */
        makeCall: function () {
            if (!this.callioEnabled || !this.callioConfigured) {
                Espo.Ui.error('Callio is not configured');
                return;
            }

            const phoneNumber = this.model.get(this.name);
            if (!phoneNumber) {
                Espo.Ui.error('Phone number is empty');
                return;
            }

            Espo.Ui.notify('Initiating call...');

            const entityType = this.model.name || 'Product';
            const entityId = this.model.id;
            const entityName = this.model.get('name');

            Espo.Ajax.postRequest('CallioCall/action/initiate', {
                phoneNumber: phoneNumber,
                entityType: entityType,
                recordId: entityId,
                additionalData: {
                    productName: entityName
                }
            })
                .then(response => {
                    if (response.success) {
                        Espo.Ui.success('Call initiated successfully');
                        
                        // Reload call history sau 1 giây
                        setTimeout(() => {
                            this.showCallHistory();
                        }, 1000);
                    } else {
                        Espo.Ui.error(response.error || 'Failed to initiate call');
                    }
                })
                .catch(error => {
                    Espo.Ui.error('Error calling Callio');
                    console.error('Call error:', error);
                });
        },

        /**
         * Hiển thị lịch sử cuộc gọi
         */
        showCallHistory: function () {
            const phoneNumber = this.model.get(this.name);
            if (!phoneNumber) {
                Espo.Ui.error('Phone number not found');
                return;
            }

            const self = this;
            const entityType = this.model.name || 'Product';
            const entityId = this.model.id;

            require('custom:views/call/call-history', function (CallHistory) {
                const modal = new CallHistory({
                    entityType: entityType,
                    entityId: entityId
                });

                modal.render();
            });
        }
    });
});
