{{!--
    =====================================================
    HISTORY PANEL TEMPLATE
    =====================================================
    Hiển thị lịch sử thay đổi từ bảng c_product_history
--}}

{{#if history}}
<div class="history-timeline">
    {{#each history}}
    <div class="history-item">
        <div class="history-item-date">{{date}}</div>
        <div class="history-item-description">{{description}}</div>
        {{#if userName}}
        <div class="history-item-user">{{translate 'Bởi' scope='CProduct'}}: {{userName}}</div>
        {{/if}}
    </div>
    {{/each}}
</div>
{{else}}
<div class="cproduct-empty-state">
    <i class="fas fa-history"></i>
    <p>{{translate 'Chưa có lịch sử thay đổi' scope='CProduct'}}</p>
    <small style="color: #999;">Bảng c_product_history sẽ được tạo sau</small>
</div>
{{/if}}
