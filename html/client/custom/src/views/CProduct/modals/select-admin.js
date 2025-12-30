define('custom:views/CProduct/modals/select-admin', ['views/modal'], function (Dep) {
  return Dep.extend({
    template: 'custom:CProduct/modals/select-admin',
    
    className: 'dialog dialog-record',
    
    data: function () {
      return {
        adminUsers: this.adminUsers || [],
        loadingAdminUsers: this.loadingAdminUsers
      };
    },
    
    events: {
      'change input[name="selectedAdmin"]': function (e) {
        this.selectedUserId = e.currentTarget.value;
        this.$el.find('.btn-apply-cdt').prop('disabled', false);
      },
      'click .btn-apply-cdt': function () {
        this.actionApply();
      }
    },
    
    setup: function () {
      this.headerText = 'Chọn Admin để gán nguồn CĐT';
      
      this.buttonList = [
        {
          name: 'cancel',
          label: 'Cancel',
          onClick: () => this.close()
        }
      ];
      
      // Initialize state
      this.loadingAdminUsers = true;
      this.selectedUserId = null;
      this.adminUsers = [];
      
      // Load admin users
      this.wait(this.loadAdminUsers());
    },
    
    /**
     * Load danh sách admin users cho panel CĐT
     */
    loadAdminUsers: function () {
      return Espo.Ajax.getRequest('CProduct/action/getAdminUsers')
        .then(response => {
          this.adminUsers = response.list || [];
          this.loadingAdminUsers = false;
          
          if (this.isRendered()) {
            this.reRender();
          }
        })
        .catch(error => {
          this.loadingAdminUsers = false;
          Espo.Ui.error('Lỗi tải danh sách admin CĐT');
          console.error('Error loading admin users:', error);
        });
    },
    
    /**
     * Apply - Mass update records
     */
    actionApply: function () {
      if (!this.selectedUserId) {
        Espo.Ui.error('Vui lòng chọn admin user');
        return;
      }
      
      this.$el.find('.btn-apply-cdt').prop('disabled', true);
      this.disableButton('cancel');
      
      Espo.Ui.notify(this.translate('pleaseWait', 'messages'));
      
      Espo.Ajax.postRequest('CProduct/action/assignAdminToSources', {
        assignedUserId: this.selectedUserId
      })
        .then(response => {
          Espo.Ui.notify(false);
          
          const count = response.count || 0;
          const message = `Đã gán ${count} nguồn CĐT cho admin được chọn`;
          
          Espo.Ui.success(message);
          
          this.trigger('success', {
            assignedUserId: this.selectedUserId,
            count: count
          });
          
          this.close();
          
          // Refresh collection
          if (this.options.collection) {
            this.options.collection.fetch();
          }
        })
        .catch(error => {
          Espo.Ui.notify(false);
          
          let message = this.translate('Error occurred');
          if (error.body && error.body.message) {
            message = error.body.message;
          }
          
          Espo.Ui.error(message);
          
          this.$el.find('.btn-apply-cdt').prop('disabled', false);
          this.enableButton('cancel');
        });
    }
  });
});
