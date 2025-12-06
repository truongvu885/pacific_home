define('custom:views/CProduct/record/list', ['views/record/list'], function (Dep) {
    
    return Dep.extend({
        
        setup: function () {
            Dep.prototype.setup.call(this);
            
            // Thêm action column vào headerDefs
            this.listenToOnce(this, 'after:render', function () {
                this.addActionColumnHeader();
            });
        },
        
        addActionColumnHeader: function () {
            // Tìm th.action-cell và thêm label
            var $actionHeader = this.$el.find('thead th:last-child');
            if ($actionHeader.length && !$actionHeader.find('.action-header-label').length) {
                var label = this.translate('Actions'); // Hoặc 'Thao tác'
                $actionHeader.prepend('<span class="action-header-label">' + label + '</span> ');
            }
        },
        
        // Hoặc override getHeader để thêm action column
        getHeader: function () {
            var header = Dep.prototype.getHeader.call(this);
            
            if (!header) return header;
            
            // Thêm action column vào cuối
            if (this.rowActionsView && !this._actionHeaderAdded) {
                header.push({
                    name: 'buttons',
                    label: this.translate('Actions'), // Label của bạn
                    width: '25px',
                    className: 'action-cell',
                    isSortable: false
                });
                this._actionHeaderAdded = true;
            }
            
            return header;
        }
    });
});