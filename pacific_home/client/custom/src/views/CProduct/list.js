define('custom:views/CProduct/list', ['views/list'], function (Dep) {
    
    return Dep.extend({
        
        template: 'custom:CProduct/list',
        
        setup: function () {
            Dep.prototype.setup.call(this);
        },
        
        afterRender: function () {
            Dep.prototype.afterRender.call(this);
            this.adjustTableScroll();
        },
        
        adjustTableScroll: function () {
            var $table = this.$el.find('.list[data-scope="CProduct"]');
            if ($table.length) {
                // Custom scroll logic
            }
        }
    });
});