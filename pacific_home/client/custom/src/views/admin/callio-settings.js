define('custom:views/admin/callio-settings', ['views/admin/index'], function (Dep) {

    return Dep.extend({

        template: 'custom:admin/callio-settings',

        events: {
            'click [data-action="save"]': function () {
                this.save();
            },
            'click [data-action="testConnection"]': function () {
                this.testConnection();
            }
        },

        data: function () {
            return {
                settings: this.settings || {},
                statistics: this.statistics || {}
            };
        },

        setup: function () {
            Dep.prototype.setup.call(this);

            this.settings = {};
            this.statistics = {};

            this.headerText = this.translate('Callio Settings', 'labels', 'Admin');

            this.wait(
                Promise.all([
                    this.loadSettings(),
                    this.loadStatistics()
                ])
            );
        },

        loadSettings: function () {
            return Espo.Ajax.getRequest('CallioAdmin/action/settings')
                .then(response => {
                    this.settings = response;
                    this.isConfigured = !!response.callioConfigured;
                });
        },

        loadStatistics: function () {
            return Espo.Ajax.getRequest('CallioAdmin/action/statistics')
                .then(response => {
                    this.statistics = response;
                });
        },

        afterRender: function () {
            try {
                Dep.prototype.afterRender.call(this);
            } catch (e) {
                console.warn('Focus error ignored:', e);
            }
            
            // Bind form values
            this.$el.find('[name="callioEnabled"]').prop('checked', this.settings.callioEnabled);
            this.$el.find('[name="callioApiUrl"]').val(this.settings.callioApiUrl);
            this.$el.find('[name="callioMasterEmail"]').val(this.settings.callioMasterEmail);
            this.$el.find('[name="callioMasterPassword"]').val(this.settings.callioMasterPassword);
            this.$el.find('[name="callioAutoCreateCall"]').prop('checked', this.settings.callioAutoCreateCall);
            this.$el.find('[name="callioShowCallHistory"]').prop('checked', this.settings.callioShowCallHistory);
            this.$el.find('[name="callioShowInListView"]').prop('checked', this.settings.callioShowInListView);

        },

        save: function () {
            let data = {
                callioEnabled: this.$el.find('[name="callioEnabled"]').is(':checked'),
                callioApiUrl: this.$el.find('[name="callioApiUrl"]').val(),
                callioMasterEmail: this.$el.find('[name="callioMasterEmail"]').val(),
                callioMasterPassword: this.$el.find('[name="callioMasterPassword"]').val(),
                callioAutoCreateCall: this.$el.find('[name="callioAutoCreateCall"]').is(':checked'),
                callioShowCallHistory: this.$el.find('[name="callioShowCallHistory"]').is(':checked'),
                callioShowInListView: this.$el.find('[name="callioShowInListView"]').is(':checked')
            };

            // Validate
            if (data.callioEnabled) {
                if (!data.callioApiUrl) {
                    Espo.Ui.error(this.translate('API URL is required', 'messages', 'Callio'));
                    return;
                }
                if (!data.callioMasterEmail) {
                    Espo.Ui.error(this.translate('Master Email is required', 'messages', 'Callio'));
                    return;
                }
            }

            if (!data.callioMasterPassword || data.callioMasterPassword === '********') {
                    Espo.Ui.error(this.translate('Master Password is required', 'messages', 'Callio'));
                    return;
            }

            Espo.Ui.notify(this.translate('Saving...'));

            Espo.Ajax.postRequest('CallioAdmin/action/settings', data)
                .then(response => {
                    if (response.success) {
                        Espo.Ui.success(this.translate('Saved'));

                        setTimeout(() => window.location.reload(), 500);
                    }
                })
                .catch(xhr => {
                    Espo.Ui.error(this.translate('Error occurred'));
                });
        },

        testConnection: function () {
            Espo.Ui.notify(this.translate('Testing connection...'));

            Espo.Ajax.postRequest('CallioAdmin/action/testConnection')
                .then(response => {
                    Espo.Ui.notify(false);

                    if (response.connected) {
                        Espo.Ui.success(
                            this.translate('Connection successful', 'labels', 'Callio')
                        );
                    } else {
                        Espo.Ui.error(
                            response.message || this.translate('Connection failed', 'labels', 'Callio')
                        );
                    }
                })
                .catch(xhr => {
                    Espo.Ui.notify(false);
                    Espo.Ui.error(
                        this.translate('Connection failed', 'labels', 'Callio')
                    );
                });
        }

    });
});
