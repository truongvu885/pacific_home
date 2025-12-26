define("custom:views/CCallioHistory/list", [
  "views/list",
  "custom:helpers/callio-loader",
], function (Dep, CallioLoader) {
  return Dep.extend({
    setup: function () {
      Dep.prototype.setup.call(this);
      console.log(this.collection);

      console.log(this.collection.models);
      this.wait(this.initCallioWidget());
    },

    afterRender: function () {
      Dep.prototype.afterRender.call(this);
      // this.actionTestController();
    },

    actionTestController: function () {
      // Test API call
      Espo.Ajax.getRequest("CCallioHistory/action/test")
        .then((response) => {
          console.log("DEBUG: Controller response:", response);
          this.notify(
            "Controller test thành công: " + response.message,
            "success"
          );
        })
        .catch((xhr) => {
          console.error("DEBUG: Controller test error:", xhr);
          this.notify(
            "Controller test thất bại: " + (xhr.status || "Unknown error"),
            "error"
          );
        });
    },
    initCallioWidget: function () {
      var user = this.getUser();
      var userId = user.id;
      // Fetch user data WITH roles từ server
      return this.getModelFactory().create(
        "User",
        function (userModel) {
          userModel.id = userId;

          this.listenToOnce(
            userModel,
            "sync",
            function () {
              var callioLoader = new CallioLoader();
              var hasRole = callioLoader.hasTelesaleRole(userModel);

              if (hasRole || userModel.attributes.type === "admin") {
                callioLoader.loadWidget({
                  baseUrl: "https://client.callio.vn",
                  token: null,
                  isCall: true,
                  isInbox: false,
                });
              } else {
                console.log(
                  "User does not have Callio role - Widget not loaded"
                );
              }
            },
            this
          );

          userModel.fetch();
        }.bind(this)
      );
    },

    // Các method khác nếu cần override
  });
});
