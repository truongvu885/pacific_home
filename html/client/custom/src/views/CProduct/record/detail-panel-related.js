/**
 * =====================================================
 * CPRODUCT PANEL 3: RELATED PRODUCTS VIEW
 * =====================================================
 * 
 * Hiển thị các product khác có cùng name
 * Logic: Query bảng c_product với field 'name' giống current product
 * Exclude current product khỏi list
 * 
 * NOTE: Implemented fetch logic using collection factory
 */

define('custom:views/CProduct/record/detail-panel-related', ['view'],
function (Dep) {
    
    return Dep.extend({
        
        template: 'custom:CProduct/record/detail-panel-related',
        
        data: function () {
            return {
                relatedProducts: this.relatedProducts || null,
                productName: this.productName || null
            };
        },
        
        /**
         * Initialize view
         */
        setup: function () {
            console.log('[CProductRelated] Setup started');
            
            var model = this.model;
            this.productName = model.get('name');
            this.productId = model.id;
            
            // Initialize empty related products
            this.relatedProducts = null;
            
            // Load related products by same name, excluding current
            this.loadRelatedProducts();
        },
        
        /**
         * Load related products having the same name (excluding current)
         */
        loadRelatedProducts: function () {
            var currentName = this.productName;
            var currentId = this.productId;
            
            if (!currentName) {
                console.warn('[CProductRelated] No product name found. Skipping related fetch.');
                return;
            }
            
            var self = this;
            
            this.getCollectionFactory().create('CProduct', function (collection) {
                // Select only required fields for display
                collection.data = collection.data || {};
                collection.data.select = [
                    'name',
                    'providerCode',
                    'price',
                    'gifts',
                    'status',
                    'bonus'
                ].join(',');
                
                // Filter: same name, exclude current id
                collection.where = [
                    { type: 'equals', attribute: 'name', value: currentName },
                    { type: 'notEquals', attribute: 'id', value: currentId }
                ];
                
                // Reasonable cap
                collection.maxSize = 50;
                
                collection.fetch().then(function () {
                    // Map to plain objects for template consumption
                    self.relatedProducts = collection.models.map(function (m) {
                        var attr = m.getClonedAttributes ? m.getClonedAttributes() : m.attributes;
                        attr.priceFormatted = self.formatVnd(attr.price);
                        return attr;
                    });
                    
                    // Re-render panel with data
                    self.reRender();
                }).catch(function (e) {
                    console.error('[CProductRelated] Fetch error:', e);
                });
            });
        },

        /**
         * Format number as Vietnamese Đồng with thousand separators
         * and a currency suffix at the end.
         */
        formatVnd: function (value) {
            if (value === null || value === undefined || value === '') return '';
            var n = Number(value);
            if (isNaN(n)) return value;
            // No decimals for VND
            n = Math.round(n);
            try {
                return n.toLocaleString('vi-VN') + ' VND';
            } catch (e) {
                // Fallback formatting
                var parts = n.toString().split('.');
                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, '.');
                return parts.join(',') + ' VND';
            }
        },
        
        /**
         * After render
         */
        afterRender: function () {
            // Template sẽ tự động hiển thị empty state nếu không có data
        }
    });
});
