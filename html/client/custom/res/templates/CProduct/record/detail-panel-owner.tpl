{{!--
    =====================================================
    OWNER PANEL TEMPLATE
    =====================================================
    Hiển thị danh sách khách hàng liên quan (CCustomer)
--}}

{{#if customers.length}}
<div class="owner-info">
    <div class="customer-list" style="overflow-y: auto; overflow-x: hidden; padding-right: 5px;">
        {{#each customers}}
        <div class="customer-item" style="padding: 10px; border-bottom: 1px solid #e8e8e8; margin-bottom: 8px; background: #fafafa; border-radius: 4px;">
            <div style="display: flex; justify-content: space-between; align-items: start;">
                <div style="flex: 1;">
                    <div style="font-weight: 600; font-size: 14px; margin-bottom: 4px;">
                        <i class="fas fa-user" style="color: #3498db; margin-right: 5px;"></i>
                        {{name}}
                    </div>
                    <div style="font-size: 13px; color: #666; margin-bottom: 2px;">
                        <i class="fas fa-phone" style="color: #27ae60; margin-right: 5px; width: 14px;"></i>
                        {{phone}}
                    </div>
                    <div style="font-size: 12px; color: #999;">
                        <i class="fas fa-calendar" style="color: #e67e22; margin-right: 5px; width: 14px;"></i>
                        {{collectedDate}}
                    </div>
                </div>
            </div>
        </div>
        {{/each}}
    </div>
</div>
{{else}}
<div class="cproduct-empty-state">
    <i class="fas fa-user-slash"></i>
    <p>{{translate 'Không tìm thấy khách hàng' scope='CProduct'}}</p>
    <small style="color: #999;">Chưa có khách hàng nào với mã trùng với tên sản phẩm này</small>
</div>
{{/if}}
