<div class="callio-admin-container">
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <i class="fas fa-cog"></i>
                        {{translate 'Callio Settings' scope='Admin'}}
                    </h4>
                </div>
                 <div class="panel-body">
                    <div class="form-group">
                        <label>
                            <input type="checkbox" name="callioEnabled"> 
                            {{translate 'Enable Callio' scope='Callio'}}
                        </label>
                        <p class="help-text">Bật/tắt tích hợp Callio cho toàn hệ thống</p>
                    </div>
                    
                    <hr>
                    
                    <div class="form-group">
                        <label>{{translate 'API URL' scope='Callio'}}</label>
                        <input type="text" 
                               class="form-control" 
                               name="callioApiUrl" 
                               placeholder="https://clientapi.phonenet.io">
                        <p class="help-text">URL API của Callio (mặc định: https://clientapi.phonenet.io)</p>
                    </div>
                    
                    <div class="form-group">
                        <label>{{translate 'Master Email' scope='Callio'}} <span class="text-danger">*</span></label>
                        <input type="email" 
                               class="form-control" 
                               name="callioMasterEmail" 
                               placeholder="email@company.com">
                        <p class="help-text">Email tài khoản chính Callio (dùng cho users không có tài khoản riêng)</p>
                    </div>
                    
                    <div class="form-group">
                        <label>{{translate 'Master Password' scope='Callio'}} <span class="text-danger">*</span></label>
                        <input type="password" 
                               class="form-control" 
                               name="callioMasterPassword" 
                               placeholder="Mật khẩu">
                        <p class="help-text">Mật khẩu tài khoản chính (được mã hóa khi lưu)</p>
                    </div>
                    
                    <hr>
                    
                    <div class="form-group">
                        <label>
                            <input type="checkbox" name="callioAutoCreateCall"> 
                            Tự động tạo Call record
                        </label>
                        <p class="help-text">Tự động tạo Call record trong CRM khi thực hiện cuộc gọi</p>
                    </div>
                    
                    <div class="form-group">
                        <label>
                            <input type="checkbox" name="callioShowCallHistory"> 
                            Hiển thị lịch sử cuộc gọi
                        </label>
                        <p class="help-text">Hiển thị panel lịch sử cuộc gọi trong Contact/Lead detail</p>
                    </div>
                    
                    <div class="form-group">
                        <label>
                            <input type="checkbox" name="callioShowInListView"> 
                            Hiển thị icon gọi trong List View
                        </label>
                        <p class="help-text">Hiển thị nút gọi ngay trong danh sách Contact/Lead</p>
                    </div>
                    
                    <hr>
                    
                    <div class="button-container">
                        <button class="btn btn-primary" data-action="save">
                            <i class="fas fa-save"></i> {{translate 'Save'}}
                        </button>
                        <button class="btn btn-default" data-action="testConnection">
                            <i class="fas fa-plug"></i> {{translate 'Test Connection' scope='Callio'}}
                        </button>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <i class="fas fa-chart-bar"></i>
                        Thống kê
                    </h4>
                </div>
                <div class="panel-body">
                    <div class="stat-item">
                        <div class="stat-label">Tổng cuộc gọi</div>
                        <div class="stat-value">{{statistics.totalCalls}}</div>
                    </div>
                    
                    <div class="stat-item">
                        <div class="stat-label">Cuộc gọi thành công</div>
                        <div class="stat-value text-success">{{statistics.successCalls}}</div>
                    </div>
                    
                    <div class="stat-item">
                        <div class="stat-label">Hôm nay</div>
                        <div class="stat-value text-info">{{statistics.todayCalls}}</div>
                    </div>
                    
                    <div class="stat-item">
                        <div class="stat-label">Tỷ lệ thành công</div>
                        <div class="stat-value">{{statistics.successRate}}%</div>
                    </div>
                </div>
            </div>
            
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <i class="fas fa-info-circle"></i>
                        Hướng dẫn
                    </h4>
                </div>
                <div class="panel-body">
                    <ol class="help-list">
                        <li>Đăng ký tài khoản tại <a href="https://callio.vn" target="_blank">callio.vn</a></li>
                        <li>Lấy thông tin email và mật khẩu đăng nhập</li>
                        <li>Điền vào form bên trái</li>
                        <li>Click "Test Connection" để kiểm tra</li>
                        <li>Click "Save" để lưu cấu hình</li>
                        <li>Gán role "Telesale" cho users cần sử dụng</li>
                    </ol>
                    
                    <div class="alert alert-info">
                        <i class="fas fa-lightbulb"></i>
                        <strong>Mẹo:</strong> Mỗi user có thể cấu hình tài khoản Callio riêng trong User Profile
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
.callio-admin-container {
    padding: 20px;
}

.panel {
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    font-weight: 600;
    margin-bottom: 8px;
    display: block;
}

.help-text {
    font-size: 12px;
    color: #999;
    margin-top: 5px;
    margin-bottom: 0;
}

.button-container {
    margin-top: 30px;
}

.button-container .btn {
    margin-right: 10px;
}

.callio-settings-form.is-readonly input[type="checkbox"] {
    cursor: not-allowed;
}

.stat-item {
    padding: 15px;
    border-bottom: 1px solid #f0f0f0;
}

.stat-item:last-child {
    border-bottom: none;
}

.stat-label {
    font-size: 12px;
    color: #999;
    text-transform: uppercase;
    margin-bottom: 5px;
}

.stat-value {
    font-size: 28px;
    font-weight: bold;
    color: #333;
}

.help-list {
    padding-left: 20px;
    font-size: 13px;
    line-height: 1.8;
}

.help-list li {
    margin-bottom: 8px;
}

.alert {
    margin-top: 15px;
    font-size: 13px;
}
</style>