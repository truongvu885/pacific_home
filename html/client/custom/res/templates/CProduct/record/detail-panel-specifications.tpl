{{!--
    =====================================================
    SPECIFICATIONS PANEL TEMPLATE
    =====================================================
    Hiển thị thông tin kỹ thuật (specifications) dạng bảng ngang
    Mỗi field là 1 column
--}}

{{#if specifications}}
<div class="spec-table-horizontal">
    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                {{#each specifications}}
                <th class="spec-header">{{fieldName}}</th>
                {{/each}}
            </tr>
        </thead>
        <tbody>
            <tr>
                {{#each specifications}}
                <td class="spec-value">
                    {{#if isNameField}}
                        <a href="javascript:" class="spec-name-link">{{fieldValue}}</a>
                    {{else}}
                        {{fieldValue}}
                    {{/if}}
                </td>
                {{/each}}
            </tr>
        </tbody>
    </table>
</div>
{{else}}
<div class="cproduct-empty-state">
    <i class="fas fa-inbox"></i>
    <p>{{translate 'Chưa có thông tin kỹ thuật' scope='CProduct'}}</p>
    <div style="margin-top: 8px;">
        <button class="btn btn-primary btn-sm spec-create-btn">
            {{translate 'Tạo thông tin kỹ thuật của nguồn hàng' scope='CProduct'}}
        </button>
    </div>
</div>
{{/if}}

