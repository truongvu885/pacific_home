define("custom:views/CCustomer/record/list", ["views/record/list"], function (
  Dep
) {
  return Dep.extend({
    setup: function () {
      Dep.prototype.setup.call(this);
    },

    afterRender: function () {
      Dep.prototype.afterRender.call(this);

      // Unbind event cũ trước khi bind lại
      this.$el.off("click", 'td.cell[data-name="phone"] span');

      // Bind custom event sau khi parent render xong
      this.$el.on(
        "click",
        'td.cell[data-name="phone"] span',
        function (e) {
          e.preventDefault();
          e.stopPropagation();
          var phoneNumber = $(e.currentTarget).text();
          this.callViaCallio(phoneNumber);
        }.bind(this)
      );

      this.$el.on(
        "click",
        'td.cell[data-name="phone2"] span',
        function (e) {
          e.preventDefault();
          e.stopPropagation();
          var phoneNumber = $(e.currentTarget).text();
          this.callViaCallio(phoneNumber);
        }.bind(this)
      );

      this.addActionColumnHeader();
    },

    addActionColumnHeader: function () {
      var $actionHeader = this.$el.find("thead th:last-child");
      if (
        $actionHeader.length &&
        !$actionHeader.find(".action-header-label").length
      ) {
        var label = this.translate("Actions");
        $actionHeader.prepend(
          '<span class="action-header-label">' + label + "</span> "
        );
      }
    },

    callViaCallio: function (phoneNumber) {
      console.log("test click in cell phone number");
      CALLIO_API.makeCall(phoneNumber);
    },
  });
});
