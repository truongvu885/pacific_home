define('custom:views/CProduct/detail', ['views/detail', 'custom:helpers/callio-loader'], 
function (Dep, CallioLoader) {
    
    return Dep.extend({
        
        setup: function () {
            Dep.prototype.setup.call(this);
            
            // Load Callio Widget nếu user có role Telesale
            this.wait(
                this.initCallioWidget()
            );
        },
        
        /**
         * Initialize Callio Widget cho Telesale users
         */
        initCallioWidget: function () {
            console.log('=== CProduct Detail - Callio Widget Debug ===');
            
            var user = this.getUser();
            var userId = user.id;
            
            console.log('Fetching roles for user:', user.get('userName'));
            
            // Fetch user data WITH roles từ server
            return this.getModelFactory().create('User', function (userModel) {
                userModel.id = userId;
                
                this.listenToOnce(userModel, 'sync', function () {
                    console.log('User data fetched from server');
                    console.log('User attributes:', userModel.attributes);
                    
                    var rolesIds = userModel.get('rolesIds');
                    var rolesNames = userModel.get('rolesNames');
                    
                    console.log('Roles IDs:', rolesIds);
                    console.log('Roles Names:', rolesNames);
                    
                    var callioLoader = new CallioLoader();
                    var hasRole = callioLoader.hasTelesaleRole(userModel);
                    
                    console.log('Has Telesale Role:', hasRole);
                    
                    if (hasRole) {
                        console.log('Loading Callio Widget...');
                        callioLoader.loadWidget({
                            baseUrl: 'https://client.callio.vn',
                            token: null,
                            isCall: true,
                            isInbox: false
                        });
                    } else {
                        console.log('User does not have Telesale role - Widget not loaded');
                    }
                }, this);
                
                userModel.fetch();
                
            }.bind(this));
        }
    });
});
