/**
 * Utility helper để load Callio Widget cho CProduct views
 */
define('custom:helpers/callio-loader', [], function () {
    
    var CallioLoader = function () {};
    
    _.extend(CallioLoader.prototype, {
        
        /**
         * Kiểm tra user có role Telesale không
         * @param {Object} user - User model với roles data
         * @return {boolean}
         */
        hasTelesaleRole: function (user) {
            console.log('CallioLoader - Checking user roles');
            
            // Lấy roles từ user model (sau khi fetch)
            var rolesIds = user.get('rolesIds') || [];
            var rolesNames = user.get('rolesNames') || {};
            
            console.log('Roles IDs:', rolesIds);
            console.log('Roles Names:', rolesNames);
            
            // Check trong rolesNames (object: {id: name})
            if (rolesNames && typeof rolesNames === 'object') {
                for (var roleId in rolesNames) {
                    var roleName = (rolesNames[roleId] || '').toLowerCase();
                    console.log('Checking role:', roleName);
                    
                    // Match chính xác role name
                    if (roleName === 'telesale' || 
                        roleName === 'tele sale' ||
                        roleName === 'tele-sale') {
                        console.log('✓ Found Telesale role!');
                        return true;
                    }
                }
            }
            
            console.log('✗ No Telesale role found');
            return false;
        },
        
        /**
         * Load Callio Widget script
         * @param {Object} options - Configuration options
         * @param {string} [options.baseUrl='https://client.callio.vn'] - Base URL
         * @param {string|null} [options.token=null] - API token
         * @param {boolean} [options.isCall=true] - Enable call feature
         * @param {boolean} [options.isInbox=false] - Enable inbox feature
         */
        loadWidget: function (options) {
            options = options || {};
            
            console.log('CallioLoader.loadWidget() called with options:', options);
            
            // Tránh load script nhiều lần
            if (window.CALLIO_LOADED) {
                console.warn('Callio Widget already loaded - skipping');
                return;
            }
            
            // Đánh dấu đã load
            window.CALLIO_LOADED = true;
            console.log('Setting CALLIO_LOADED flag to true');
            
            // Setup Callio API config
            window.CALLIO_API = {
                baseUrl: options.baseUrl || 'https://client.callio.vn',
                token: options.token || null,
                options: {
                    isCall: options.isCall !== undefined ? options.isCall : true,
                    isInbox: options.isInbox !== undefined ? options.isInbox : false
                }
            };
            
            window.CALLIO_LoadStart = new Date();
            
            console.log('CALLIO_API config:', window.CALLIO_API);
            
            // Inject script vào page
            var script = document.createElement('script');
            script.async = true;
            script.src = window.CALLIO_API.baseUrl + '/widget-embed.js';
            script.charset = 'UTF-8';
            script.id = 'callio-widget-script';
            
            console.log('Creating script tag with src:', script.src);
            
            // Add error handler
            script.onerror = function(e) {
                console.error('❌ Failed to load Callio Widget from:', script.src);
                console.error('Error:', e);
                window.CALLIO_LOADED = false;
            };
            
            // Add success handler
            script.onload = function() {
                console.log('✓ Callio Widget script loaded successfully!');
                console.log('Script element:', script);
            };
            
            var firstScript = document.getElementsByTagName('script')[0];
            if (firstScript && firstScript.parentNode) {
                console.log('Inserting script before first script tag');
                firstScript.parentNode.insertBefore(script, firstScript);
            } else {
                console.log('Appending script to document.head');
                document.head.appendChild(script);
            }
            
            console.log('Script tag inserted into DOM');
            
            // Verify script was added
            setTimeout(function() {
                var scriptCheck = document.getElementById('callio-widget-script');
                if (scriptCheck) {
                    console.log('✓ Script verified in DOM');
                } else {
                    console.error('✗ Script NOT found in DOM after insertion!');
                }
            }, 100);
        },
        
        /**
         * Unload Callio Widget (nếu cần)
         */
        unloadWidget: function () {
            // Remove script tag
            var scripts = document.querySelectorAll('script[src*="widget-embed.js"]');
            scripts.forEach(function(script) {
                script.remove();
            });
            
            // Reset flag
            window.CALLIO_LOADED = false;
            
            // Clean up global variables
            delete window.CALLIO_API;
            delete window.CALLIO_LoadStart;
            
            console.log('Callio Widget unloaded');
        }
    });
    
    return CallioLoader;
});
