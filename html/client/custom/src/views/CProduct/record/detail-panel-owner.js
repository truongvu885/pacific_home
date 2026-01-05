/**
 * =====================================================
 * CPRODUCT PANEL 2: OWNER INFORMATION VIEW
 * =====================================================
 * 
 * Hiển thị thông tin khách hàng (CCustomer) liên quan đến product
 * Lấy dữ liệu từ bảng CCustomer với điều kiện CProduct.name = CCustomer.code
 * Sắp xếp theo collectedDate giảm dần
 */

define('custom:views/CProduct/record/detail-panel-owner', ['view'],
function (Dep) {
    
    return Dep.extend({
        
        template: 'custom:CProduct/record/detail-panel-owner',
        
        data: function () {
            return {
                owner: this.owner || null,
                ownerFields: this.ownerFields || null,
                customers: this.customers || []
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
            this.customers = [];
            
            // Load customer data
            var model = this.model;
            var productName = model.get('name');
            
            if (productName) {
                this.loadCustomerData(productName);
            }
        },
        
        /**
         * Load customer data from CCustomer table
         * @param {string} productName - CProduct name to match with CCustomer code
         */
        loadCustomerData: async function (productName) {
            console.log('[CProductOwner] Loading customer data for product:', productName);
            
            try {
                // Call API to get CCustomer records
                const url = 'CCustomer';
                const params = {
                    where: [
                        {
                            type: 'equals',
                            attribute: 'code',
                            value: productName
                        }
                    ],
                    orderBy: 'collectedDate',
                    order: 'desc',
                    maxSize: 50 // Limit results
                };
                
                const response = await Espo.Ajax.getRequest(url, params);
                
                if (response && response.list && response.list.length > 0) {
                    console.log('[CProductOwner] Found customers:', response.list.length);
                    
                    // Format customer data for display
                    this.customers = response.list.map(customer => {
                        return {
                            name: customer.name || '-',
                            phone: customer.phone || '-',
                            collectedDate: customer.collectedDate 
                                ? this.formatDate(customer.collectedDate) 
                                : '-'
                        };
                    });
                    
                    // Rerender to display data
                    this.reRender();
                } else {
                    console.log('[CProductOwner] No customers found');
                    this.customers = [];
                }
            } catch (error) {
                console.error('[CProductOwner] Error loading customer data:', error);
                this.customers = [];
            }
        },
        
        /**
         * Format date for display
         * @param {string} dateString - Date string to format
         * @returns {string} Formatted date
         */
        formatDate: function (dateString) {
            if (!dateString) return '-';
            
            try {
                const date = new Date(dateString);
                const day = String(date.getDate()).padStart(2, '0');
                const month = String(date.getMonth() + 1).padStart(2, '0');
                const year = date.getFullYear();
                return `${day}/${month}/${year}`;
            } catch (error) {
                console.error('[CProductOwner] Error formatting date:', error);
                return dateString;
            }
        },
        
        /**
         * After render
         */
        afterRender: function () {
            // Template will automatically display customer data or empty state
            this.adjustCustomerListHeight();
        },
        
        /**
         * Adjust customer list height to match panel height
         */
        adjustCustomerListHeight: function () {
            setTimeout(() => {
                const customerList = this.$el.find('.customer-list');
                
                if (customerList.length) {
                    // Try to find the panel container
                    const panel = this.$el.closest('.panel');
                    const panelBody = this.$el.closest('.panel-body');
                    
                    let maxHeight = 300; // Default height
                    
                    // If panel body exists, calculate based on its height
                    if (panelBody.length) {
                        const bodyHeight = panelBody.height();
                        if (bodyHeight > 0) {
                            maxHeight = bodyHeight - 40; // Leave some padding
                        }
                    } else if (panel.length) {
                        const panelHeight = panel.height();
                        if (panelHeight > 0) {
                            maxHeight = panelHeight - 80; // Leave room for header
                        }
                    }
                    
                    // Ensure minimum and maximum bounds
                    maxHeight = Math.max(maxHeight, 200); // Minimum 200px
                    maxHeight = Math.min(maxHeight, 500); // Maximum 500px
                    
                    customerList.css({
                        'max-height': maxHeight + 'px',
                        'overflow-y': 'auto',
                        'overflow-x': 'hidden'
                    });
                    
                    console.log('[CProductOwner] Adjusted customer list height to:', maxHeight + 'px');
                }
            }, 200);
        }
    });
});
