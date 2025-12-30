<div class="assigned-user-info-container">
  {{#if hasAssignedUser}}
    <div class="user-info-row">
      <span class="fas fa-user text-muted" style="margin-right: 8px;"></span>
      <strong>{{assignedUserName}}</strong>
    </div>
    {{#if assignedUserPhone}}
      <div class="user-info-row" style="margin-top: 4px;">
        <span class="fas fa-phone text-muted" style="margin-right: 8px;"></span>
        <a href="tel:{{assignedUserPhone}}">{{assignedUserPhone}}</a>
      </div>
    {{else}}
      <div class="user-info-row text-muted" style="margin-top: 4px; font-size: 0.9em;">
        <span class="fas fa-phone" style="margin-right: 8px;"></span>
        <span>Chưa có số điện thoại</span>
      </div>
    {{/if}}
  {{else}}
    <span class="text-muted">Chưa phân công</span>
  {{/if}}
</div>
