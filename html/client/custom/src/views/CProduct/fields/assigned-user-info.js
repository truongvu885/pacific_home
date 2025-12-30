define('custom:views/CProduct/fields/assigned-user-info', ['views/fields/base'], function (Dep) {
  return Dep.extend({
    detailTemplate: 'custom:CProduct/fields/assigned-user-info/detail',
    
    data: function () {
      let assignedUserName = this.model.get('assignedUserName') || '-';
      let assignedUserPhone = this.assignedUserPhone || '-';
      let assignedUserId = this.model.get('assignedUserId');
      
      return {
        assignedUserName: assignedUserName,
        assignedUserPhone: assignedUserPhone,
        assignedUserId: assignedUserId,
        hasAssignedUser: !!assignedUserId
      };
    },
    
    setup: function () {
      Dep.prototype.setup.call(this);
      
      this.assignedUserPhone = null;
      
      // Fetch phone number của assigned user
      this.loadAssignedUserPhone();
      
      // Listen to changes
      this.listenTo(this.model, 'change:assignedUserId', () => {
        this.loadAssignedUserPhone();
      });
    },
    
    loadAssignedUserPhone: function () {
      const assignedUserId = this.model.get('assignedUserId');
      
      if (!assignedUserId) {
        this.assignedUserPhone = null;
        if (this.isRendered()) {
          this.reRender();
        }
        return;
      }
      
      // Fetch user data để lấy phone
      this.getModelFactory().create('User', (userModel) => {
        userModel.id = assignedUserId;
        
        userModel.fetch().then(() => {
          // Lấy phone number (field phoneNumber trong User entity)
          this.assignedUserPhone = userModel.get('phoneNumber') || null;
          
          if (this.isRendered()) {
            this.reRender();
          }
        });
      });
    }
  });
});
