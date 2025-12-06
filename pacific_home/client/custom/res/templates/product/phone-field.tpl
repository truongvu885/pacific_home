<div class="product-phone-field">
    {{#if phoneNumber}}
        <div class="input-group">
            <span class="input-group-addon">
                <i class="fas fa-phone"></i>
            </span>
            <input type="text" 
                   class="form-control" 
                   value="{{phoneNumber}}" 
                   readonly 
                   title="{{phoneNumber}}">
            <span class="input-group-btn">
                {{#if callioEnabled}}
                    <button class="btn btn-primary" 
                            data-action="makeCall" 
                            data-phone="{{phoneNumber}}"
                            title="Click để gọi qua Callio">
                        <i class="fas fa-phone-alt"></i>
                        Gọi
                    </button>
                    <button class="btn btn-default" 
                            data-action="showCallHistory"
                            title="Xem lịch sử cuộc gọi">
                        <i class="fas fa-history"></i>
                    </button>
                {{/if}}
            </span>
        </div>
        
        {{#if callioEnabled}}
            <div class="phone-field-help-text">
                <small class="text-muted">
                    <i class="fas fa-info-circle"></i>
                    Click nút "Gọi" để thực hiện cuộc gọi qua Callio
                </small>
            </div>
        {{/if}}
    {{else}}
        <div class="alert alert-info">
            <i class="fas fa-info-circle"></i>
            Chưa có số điện thoại
        </div>
    {{/if}}
</div>

<style>
.product-phone-field {
    padding: 10px;
    background-color: #f9f9f9;
    border-radius: 4px;
    border: 1px solid #e3e3e3;
}

.product-phone-field .input-group {
    margin-bottom: 8px;
}

.product-phone-field .input-group-addon {
    background-color: #f5f5f5;
    color: #333;
}

.product-phone-field .form-control {
    background-color: white;
}

.product-phone-field .input-group-btn {
    position: relative;
}

.product-phone-field .input-group-btn .btn {
    margin-left: 2px;
}

.product-phone-field .btn-primary {
    background-color: #337ab7;
    border-color: #2e6da4;
    color: white;
}

.product-phone-field .btn-primary:hover {
    background-color: #286090;
    border-color: #204d74;
}

.product-phone-field .btn-primary i {
    margin-right: 4px;
}

.phone-field-help-text {
    padding: 5px 0;
    margin-top: 5px;
    border-top: 1px solid #e3e3e3;
    padding-top: 8px;
}

.alert-info {
    padding: 8px 12px;
    margin: 0;
    font-size: 13px;
}
</style>
