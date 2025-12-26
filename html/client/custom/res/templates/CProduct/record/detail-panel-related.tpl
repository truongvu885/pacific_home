{{!--
    =====================================================
    RELATED PRODUCTS PANEL TEMPLATE
    =====================================================
    Hiển thị các sản phẩm cùng mã code
--}}

{{#if relatedProducts}}
<div class="related-grid-wrapper" style="overflow-x: auto;">
<table class="related-grid" style="min-width: 720px;">
    <thead>
        <tr>
            <th>{{translate 'Mã căn' scope='CProduct'}}</th>
            <th>{{translate 'Mã nhà phân phối' scope='CProduct'}}</th>
            <th>{{translate 'Giá' scope='CProduct'}}</th>
            <th>{{translate 'Quà tặng' scope='CProduct'}}</th>
            <th>{{translate 'Trạng thái' scope='CProduct'}}</th>
            <th>{{translate 'Thưởng sales' scope='CProduct'}}</th>
        </tr>
    </thead>
    <tbody>
        {{#each relatedProducts}}
        <tr>
            <td>
                <a href="#CProduct/view/{{id}}" class="row-action">{{name}}</a>
            </td>
            <td>{{providerCode}}</td>
            <td>{{priceFormatted}}</td>
            <td>{{gifts}}</td>
            <td>{{status}}</td>
            <td>{{bonus}}</td>
        </tr>
        {{/each}}
    </tbody>
</table>
</div>
{{else}}
<div class="cproduct-empty-state">
    <i class="fas fa-link"></i>
    <p>{{translate 'Không có nguồn hàng cùng mã' scope='CProduct'}}</p>
    <small style="color: #999;">{{#if productName}}Tên: {{productName}}{{else}}Chưa có sản phẩm cùng mã{{/if}}</small>
</div>
{{/if}}
