// /**
//  * File: client/custom/src/views/call/call-history.js
//  * View hiển thị lịch sử cuộc gọi từ Callio
//  */

// define('custom:views/call/call-history', ['views/modal', 'jquery'], function (ModalView, $) {

//     return ModalView.extend({

//         template: 'custom:call/call-history',

//         headerText: 'Call History',

//         events: _.extend(ModalView.prototype.events || {}, {
//             'click [data-action="refresh"]': function () {
//                 this.loadCallHistory();
//             },
//             'click [data-action="filterByDate"]': function () {
//                 this.showDateFilter();
//             }
//         }),

//         data: function () {
//             return {
//                 calls: this.calls || [],
//                 loading: this.loading || false,
//                 entityType: this.options.entityType,
//                 entityId: this.options.entityId,
//                 stats: this.stats || {}
//             };
//         },

//         setup: function () {
//             ModalView.prototype.setup.call(this);

//             this.calls = [];
//             this.stats = {};
//             this.loading = true;
//             this.entityType = this.options.entityType || 'Product';
//             this.entityId = this.options.entityId;

//             this.headerText = 'Call History - ' + (this.options.entityType || 'Product');

//             // Load call history khi view render
//             this.loadCallHistory();
//         },

//         /**
//          * Load lịch sử cuộc gọi từ backend
//          */
//         loadCallHistory: function () {
//             this.loading = true;
//             this.notify('Loading call history...');

//             const url = 'CallioHistory/by-entity?entityType=' + this.entityType + 
//                         '&entityId=' + this.entityId + '&limit=50';

//             Espo.Ajax.getRequest(url)
//                 .then(response => {
//                     if (response.success) {
//                         this.calls = response.data || [];
//                         this.stats = {
//                             total: response.total || 0,
//                             limit: response.limit || 50,
//                             offset: response.offset || 0
//                         };
//                     } else {
//                         this.calls = [];
//                         Espo.Ui.error(response.error || 'Failed to load call history');
//                     }
//                     this.loading = false;
//                     this.reRender();
//                     this.hideNotification();
//                 })
//                 .catch(error => {
//                     this.calls = [];
//                     this.loading = false;
//                     Espo.Ui.error('Error loading call history');
//                     console.error('Call history error:', error);
//                     this.hideNotification();
//                 });
//         },

//         /**
//          * Format thời gian để display
//          */
//         formatTime: function (dateString) {
//             if (!dateString) return '-';
//             const date = new Date(dateString);
//             return date.toLocaleString('vi-VN');
//         },

//         /**
//          * Format duration (seconds to HH:mm:ss)
//          */
//         formatDuration: function (seconds) {
//             if (!seconds) return '0s';
            
//             const hours = Math.floor(seconds / 3600);
//             const minutes = Math.floor((seconds % 3600) / 60);
//             const secs = seconds % 60;

//             let result = '';
//             if (hours > 0) result += hours + 'h ';
//             if (minutes > 0) result += minutes + 'm ';
//             result += secs + 's';

//             return result.trim();
//         },

//         /**
//          * Get badge CSS class dựa vào status
//          */
//         getStatusBadgeClass: function (status) {
//             const statusMap = {
//                 'completed': 'label-success',
//                 'Held': 'label-success',
//                 'failed': 'label-danger',
//                 'Not Held': 'label-danger',
//                 'initiated': 'label-info',
//                 'ongoing': 'label-warning'
//             };
//             return statusMap[status] || 'label-default';
//         },

//         /**
//          * Get status text tiếng Việt
//          */
//         getStatusText: function (status) {
//             const statusMap = {
//                 'completed': 'Hoàn thành',
//                 'Held': 'Hoàn thành',
//                 'failed': 'Thất bại',
//                 'Not Held': 'Thất bại',
//                 'initiated': 'Đã khởi tạo',
//                 'ongoing': 'Đang gọi'
//             };
//             return statusMap[status] || status;
//         },

//         /**
//          * Download recording nếu có
//          */
//         downloadRecording: function (recordingUrl) {
//             if (!recordingUrl) return;
//             window.open(recordingUrl, '_blank');
//         },

//         afterRender: function () {
//             ModalView.prototype.afterRender.call(this);

//             // Format các call data để display
//             if (this.calls && this.calls.length > 0) {
//                 this.calls.forEach(call => {
//                     call.formattedDateStart = this.formatTime(call.dateStart);
//                     call.formattedDuration = this.formatDuration(call.duration);
//                     call.statusBadgeClass = this.getStatusBadgeClass(call.status);
//                     call.statusText = this.getStatusText(call.status);
//                 });
//             }

//             // Attach event listeners
//             const self = this;
//             this.$el.find('[data-action="downloadRecording"]').each(function () {
//                 const recordingUrl = $(this).data('url');
//                 $(this).click(function (e) {
//                     e.preventDefault();
//                     self.downloadRecording(recordingUrl);
//                 });
//             });
//         },

//         showDateFilter: function () {
//             // TODO: Implement date range filter
//             Espo.Ui.info('Date filter coming soon');
//         }
//     });
// });
