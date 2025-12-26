define("custom:views/Lead/record/list", ["views/record/list"], function (Dep) {
  return Dep.extend({
    setup: function () {
      Dep.prototype.setup.call(this);
    },

    afterRender: function () {
      Dep.prototype.afterRender.call(this);

      // Unbind event cũ trước khi bind lại
      this.$el.off("click", 'td.cell[data-name="phoneNumber"] a');

      // Bind custom event sau khi parent render xong
      this.$el.on(
        "click",
        'td.cell[data-name="phoneNumber"] a',
        function (e) {
          e.preventDefault();
          e.stopPropagation();
          var phoneNumber = $(e.currentTarget).text();
          this.callViaCallio(phoneNumber);
        }.bind(this)
      );

      this.addActionColumnHeader();
    },

    callViaCallio: function (phoneNumber) {
      CALLIO_API.makeCall(phoneNumber);
    },
  });
});
