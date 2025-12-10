<div class="field-container product-phone-field">
    {{#if isEditing}}
        <input class="form-control main-element" type="text" name="{{name}}" value="{{value}}" placeholder="{{placeholder}}" data-parse-empty-string="true">
    {{else}}
        <div class="product-phone-display">
            {{#if value}}
                <div class="phone-display-group">
                    <span class="phone-value">{{value}}</span>
                    {{#if callioEnabled}}
                        <div class="phone-actions">
                            <button class="btn btn-sm btn-primary" 
                                    data-action="makeCall"
                                    title="Click để gọi qua Callio">
                                <i class="fas fa-phone-alt"></i>
                                Gọi
                            </button>
                            <button class="btn btn-sm btn-default" 
                                    data-action="showCallHistory"
                                    title="Xem lịch sử cuộc gọi">
                                <i class="fas fa-history"></i>
                                Lịch sử
                            </button>
                        </div>
                    {{/if}}
                </div>
            {{else}}
                <span class="text-muted">-</span>
            {{/if}}
        </div>
    {{/if}}
</div>

<style>
.product-phone-field {
    display: inline-block;
    width: 100%;
}

.product-phone-display {
    padding: 8px;
    background-color: #f9f9f9;
    border-radius: 3px;
}

.phone-display-group {
    display: flex;
    align-items: center;
    gap: 8px;
}

.phone-value {
    font-weight: bold;
    font-size: 14px;
    color: #333;
    padding: 4px 8px;
    background-color: white;
    border-radius: 3px;
    border: 1px solid #ddd;
    flex: 1;
}

.phone-actions {
    display: flex;
    gap: 4px;
}

.phone-actions .btn-sm {
    padding: 4px 8px;
    font-size: 12px;
}

.phone-actions .btn-primary {
    background-color: #337ab7;
    border-color: #2e6da4;
}

.phone-actions .btn-primary:hover {
    background-color: #286090;
    border-color: #204d74;
}

@media (max-width: 768px) {
    .phone-display-group {
        flex-direction: column;
        align-items: flex-start;
    }
    
    .phone-actions {
        width: 100%;
        margin-top: 4px;
    }
    
    .phone-actions .btn {
        flex: 1;
    }
}
</style>
