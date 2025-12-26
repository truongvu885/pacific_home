/**
 * =====================================================
 * CPRODUCT PANEL 2: OWNER INFORMATION VIEW
 * =====================================================
 * 
 * Hiển thị thông tin sở hữu của product
 * Fetch từ bảng quan hệ (tên bảng sẽ được chỉ định sau)
 * Quan hệ: N-1 (many CProduct belong to one owner table)
 * 
 * NOTE: Bảng chưa xác định, tạm thời hiển thị empty state
 */

define('custom:views/CProduct/record/detail-panel-owner', ['view'],
function (Dep) {
    
    return Dep.extend({
        
        template: 'custom:CProduct/record/detail-panel-owner',
        
        data: function () {
            return {
                owner: this.owner || null,
                ownerFields: this.ownerFields || null
            };
        },
        
        /**
         * Initialize view
         */
        setup: function () {
            console.log('[CProductOwner] Setup started');
            
            // Initialize empty owner data
            this.owner = null;
            this.ownerFields = null;
            
            // TODO: Sau khi xác định owner table, uncomment code bên dưới
            // var model = this.model;
            // var modelId = model.id;
            // this.loadOwner(modelId);
        },
        
        /**
         * After render
         */
        afterRender: function () {
            // Template sẽ tự động hiển thị empty state nếu không có data
        }
    });
});
