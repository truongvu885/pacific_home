define("custom:views/CCustomer/list", [
  "views/list",
  "custom:helpers/callio-loader",
], function (Dep, CallioLoader) {
  return Dep.extend({
    setup: function () {
      Dep.prototype.setup.call(this);
      // Load Callio Widget nếu user có role Telesale
      this.wait(this.initCallioWidget());
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
  });
});
