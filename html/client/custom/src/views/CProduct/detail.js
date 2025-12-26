define('custom:views/CProduct/detail', ['views/detail', 'custom:helpers/callio-loader'], 
function (Dep, CallioLoader) {
    
    return Dep.extend({
        
        /**
         * Custom template cho CProduct detail view
         * Template path: client/custom/res/templates/CProduct/detail.tpl
         * Template sẽ render custom layout với 5 panels
         */
        template: 'custom:CProduct/detail',
        
        setup: function () {
            Dep.prototype.setup.call(this);
            
            // Load Callio Widget nếu user có role Telesale va admin
            this.wait(
                this.initCallioWidget()
            );
        },
        
        afterRender: function () {
            Dep.prototype.afterRender.call(this);
        },
             
        /**
         * Initialize Callio Widget cho Telesale va admin users
         */
        initCallioWidget: function () {
            
            var user = this.getUser();
            var userId = user.id;
            
            // Fetch user data WITH roles từ server
            return this.getModelFactory().create('User', function (userModel) {
                userModel.id = userId;
                
                this.listenToOnce(userModel, 'sync', function () {
                    
                    var callioLoader = new CallioLoader();
                    var hasRole = callioLoader.hasTelesaleRole(userModel);
                    
                    if (hasRole || userModel.attributes.type === "admin") {
                        callioLoader.loadWidget({
                            baseUrl: 'https://client.callio.vn',
                            token: null,
                            isCall: true,
                            isInbox: false
                        });
                    } else {
                        console.log('User does not have Callio role - Widget not loaded');
                    }
                }, this);
                
                userModel.fetch();
                
            }.bind(this));
        }
    });
});
