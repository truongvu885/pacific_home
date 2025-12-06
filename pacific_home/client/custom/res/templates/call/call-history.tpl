<div class="call-history-container">
    {{#if loading}}
        <div class="text-center" style="padding: 50px 0;">
            <i class="fas fa-spinner fa-spin fa-2x"></i>
            <p>{{translate 'Loading' scope='Global'}}...</p>
        </div>
    {{else}}
        {{#if calls}}
            <div class="call-history-stats">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="stat-box">
                            <span class="stat-label">Tổng cuộc gọi:</span>
                            <span class="stat-value">{{stats.total}}</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="call-history-toolbar">
                <button class="btn btn-sm btn-default" data-action="refresh">
                    <i class="fas fa-sync-alt"></i>
                    {{translate 'Refresh'}}
                </button>
                <button class="btn btn-sm btn-default" data-action="filterByDate">
                    <i class="fas fa-calendar"></i>
                    {{translate 'Filter by Date'}}
                </button>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-hover call-history-table">
                    <thead>
                        <tr>
                            <th>Thời gian</th>
                            <th>Số điện thoại</th>
                            <th>Trạng thái</th>
                            <th>Thời lượng</th>
                            <th>Ghi âm</th>
                            <th>Ghi chú</th>
                        </tr>
                    </thead>
                    <tbody>
                        {{#each calls}}
                            <tr class="call-record">
                                <td>
                                    <span class="call-date" title="{{dateStart}}">
                                        {{formattedDateStart}}
                                    </span>
                                </td>
                                <td>
                                    <span class="phone-number">{{phoneNumber}}</span>
                                </td>
                                <td>
                                    <span class="label {{statusBadgeClass}}">
                                        {{statusText}}
                                    </span>
                                </td>
                                <td>
                                    <span class="call-duration">{{formattedDuration}}</span>
                                </td>
                                <td>
                                    {{#if recordingUrl}}
                                        <button class="btn btn-xs btn-primary" 
                                                data-action="downloadRecording"
                                                data-url="{{recordingUrl}}"
                                                title="Download recording">
                                            <i class="fas fa-download"></i>
                                        </button>
                                    {{else}}
                                        <span class="text-muted">-</span>
                                    {{/if}}
                                </td>
                                <td>
                                    {{#if notes}}
                                        <span class="call-notes" title="{{notes}}">
                                            {{notes}}
                                        </span>
                                    {{else}}
                                        <span class="text-muted">-</span>
                                    {{/if}}
                                </td>
                            </tr>
                        {{/each}}
                    </tbody>
                </table>
            </div>
        {{else}}
            <div class="text-center text-muted" style="padding: 30px;">
                <p>
                    <i class="fas fa-phone fa-2x" style="opacity: 0.3; margin-bottom: 10px; display: block;"></i>
                    {{translate 'No calls found' scope='Global'}}
                </p>
            </div>
        {{/if}}
    {{/if}}
</div>

<style>
.call-history-container {
    padding: 15px;
}

.call-history-stats {
    margin-bottom: 20px;
    padding: 15px;
    background-color: #f5f5f5;
    border-radius: 4px;
}

.stat-box {
    padding: 10px;
    text-align: center;
}

.stat-label {
    display: block;
    font-size: 12px;
    color: #666;
    margin-bottom: 5px;
    text-transform: uppercase;
}

.stat-value {
    display: block;
    font-size: 24px;
    font-weight: bold;
    color: #333;
}

.call-history-toolbar {
    margin-bottom: 15px;
    padding: 10px 0;
    border-bottom: 1px solid #ddd;
}

.call-history-toolbar button {
    margin-right: 5px;
}

.call-history-table {
    font-size: 13px;
    margin: 0;
}

.call-history-table th {
    background-color: #f9f9f9;
    font-weight: bold;
    border-bottom: 2px solid #ddd;
}

.call-history-table td {
    vertical-align: middle;
}

.call-record:hover {
    background-color: #f9f9f9;
}

.call-date {
    font-size: 12px;
    color: #666;
}

.phone-number {
    font-weight: bold;
    color: #333;
    font-size: 13px;
}

.call-duration {
    color: #337ab7;
    font-weight: bold;
}

.call-notes {
    font-size: 12px;
    color: #666;
    display: inline-block;
    max-width: 200px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.label {
    padding: 4px 8px;
    border-radius: 3px;
    font-weight: bold;
    font-size: 11px;
    text-transform: uppercase;
}

.label-success {
    background-color: #5cb85c;
    color: white;
}

.label-danger {
    background-color: #d9534f;
    color: white;
}

.label-info {
    background-color: #5bc0de;
    color: white;
}

.label-warning {
    background-color: #f0ad4e;
    color: white;
}

.label-default {
    background-color: #999;
    color: white;
}
</style>
