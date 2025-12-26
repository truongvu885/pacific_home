{{!--
    =====================================================
    OWNER PANEL TEMPLATE
    =====================================================
    Hiển thị thông tin sở hữu
--}}

{{#if owner}}
<div class="owner-info">
    {{#each ownerFields}}
    <div class="owner-item">
        <div class="owner-label">{{label}}</div>
        <div class="owner-value">{{value}}</div>
    </div>
    {{/each}}
</div>
{{else}}
<div class="cproduct-empty-state">
    <i class="fas fa-user-slash"></i>
    <p>{{translate 'Chưa có thông tin sở hữu' scope='CProduct'}}</p>
    <small style="color: #999;">Dữ liệu owner sẽ được thêm sau</small>
</div>
{{/if}}
