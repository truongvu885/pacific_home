<!-- Panel CĐT -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h4 class="panel-title">Đăng ký Admin cho nguồn hàng CĐT</h4>
  </div>
  <div class="panel-body">
    {{#if loadingAdminUsers}}
      <div class="text-center">
        <span class="fas fa-spinner fa-spin"></span>
        <span>Đang tải danh sách admin...</span>
      </div>
    {{else}}
      {{#if adminUsers.length}}
        <div class="admin-users-list" style="max-height: 300px; overflow-y: auto;">
          {{#each adminUsers}}
            <div class="radio">
              <label style="cursor: pointer;">
                <input 
                  type="radio" 
                  name="selectedAdmin" 
                  value="{{id}}"
                  style="margin-right: 8px;"
                >
                <strong>{{userName}}</strong>
                {{#if name}}
                  <span class="text-muted">({{name}})</span>
                {{/if}}
              </label>
            </div>
          {{/each}}
        </div>
      {{else}}
        <div class="alert alert-warning">
          Không tìm thấy admin user nào.
        </div>
      {{/if}}
    {{/if}}
    
    <!-- Button Apply -->
    <div class="margin-top">
      <button class="btn btn-primary btn-apply-cdt" type="button" disabled>
        <span class="fas fa-check"></span> Apply
      </button>
    </div>
  </div>
</div>

