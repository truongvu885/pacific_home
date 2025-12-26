define("custom:views/CSpecification/record/edit", [
  "views/record/edit",
], function (Dep) {
  return Dep.extend({
    /**
     * Setup - gọi trước khi render
     * Auto-fill 'name' field từ query parameter
     */
    setup: function () {
      console.log("[CSpecification Edit] Setup started");

      Dep.prototype.setup.call(this);

      // Lấy query parameter 'name' từ options.params
      var name = this.options.params && this.options.params.name ? this.options.params.name : null;

      console.log("[CSpecification Edit] Query param name:", name);

      if (name) {
        console.log("[CSpecification Edit] Auto-fill name:", name);

        // Set value cho field 'name' trong model
        // Đoạn này chạy trước khi render form
        this.model.set("name", name);
      }
    },

    /**
     * AfterRender - verify giá trị đã được fill
     */
    afterRender: function () {
      Dep.prototype.afterRender.call(this);

      var name = this.model.get("name");
      console.log("[CSpecification Edit] After render - name value:", name);
    },
  });
});
