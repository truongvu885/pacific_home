define("custom:views/CProduct/list", [
  "views/list",
  "custom:helpers/callio-loader",
], function (Dep, CallioLoader) {
  return Dep.extend({
    template: "custom:CProduct/list",

    setup: function () {
      Dep.prototype.setup.call(this);
      // Load Callio Widget nếu user có role Telesale
      this.wait(this.initCallioWidget());
    },

    afterRender: function () {
      Dep.prototype.afterRender.call(this);

      // Build checkbox-based dropdown menu
      this.buildColumnsDropdown();

      // Rebuild each time the dropdown is opened to reflect current columns
      this.$el.off(
        "click.__columnsToggle",
        ".settings-container .dropdown-toggle"
      );
      this.$el.on(
        "click.__columnsToggle",
        ".settings-container .dropdown-toggle",
        (e) => {
          this.buildColumnsDropdown();
        }
      );
    },

    /**
     * Initialize Callio Widget cho Telesale users
     */
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

    buildColumnsDropdown: function () {
      const menu = this.$el.find(".settings-container .dropdown-menu");
      if (!menu.length) return;

      const columns = [];
      const self = this;
      const stored = this.getStoredSelection();

      // Capture current columns from header (exclude first checkbox column and last actions column)
      this.$el.find(".list table thead th").each(function (index, el) {
        const name = $(this).data("name");
        // Skip first column (row selection checkbox) and columns without data-name (like actions)
        if (index === 0 || !name) {
          return;
        }
        const label = $(this).text().trim() || name;
        // If stored is 'all' or not set, default to checked
        const checked =
          stored === "all"
            ? true
            : stored
            ? stored.includes(name)
            : self.isColumnVisible(name);
        columns.push({ name: name, label: label, checked: checked });
      });

      // Build dropdown content
      menu.empty();

      const list = $("<div/>", {
        class: "columns-dropdown",
        style: "min-width: max-content;",
      });
      const selectAllId = "columns-select-all-" + new Date().getTime();

      const selectAllWrapper = $("<div/>", {
        class: "columns-select-all",
        style: "padding: 6px 12px; font-weight: 600;",
      });
      const selectAll = $("<input/>", { type: "checkbox", id: selectAllId });
      const selectAllLabel = $("<label/>", {
        for: selectAllId,
        text: "Select All",
        style: "margin-left: 6px; cursor: pointer;",
      });
      selectAllWrapper.append(selectAll).append(selectAllLabel);

      const actions = $("<div/>", {
        class: "columns-actions",
        style: "padding: 6px 12px; text-align:center;",
      });
      const applyBtn = $("<button/>", {
        class: "btn btn-primary btn-sm",
        style: "width:50%",
        text: this.translate("Apply", "labels") || "Apply",
      });
      actions.append(applyBtn);
      list.append(actions);

      list.append(selectAllWrapper);
      list.append($("<hr/>", { style: "margin: 4px 0;" }));

      columns.forEach((col) => {
        const item = $("<div/>", {
          class: "columns-item",
          style: "padding: 4px 12px;",
        });
        const cbId = "col-" + col.name + "-" + new Date().getTime();
        const checkbox = $("<input/>", {
          type: "checkbox",
          "data-name": col.name,
          id: cbId,
        });
        if (col.checked) checkbox.prop("checked", true);
        const label = $("<label/>", {
          for: cbId,
          text: col.label,
          style: "margin-left: 6px; cursor: pointer;",
        });
        item.append(checkbox).append(label);
        list.append(item);
      });

      // Stop clicks from closing dropdown immediately
      list.on("click", function (e) {
        e.stopPropagation();
      });

      // Select all toggle
      selectAll.on("change", function () {
        const checked = $(this).is(":checked");
        list.find('input[type="checkbox"][data-name]').prop("checked", checked);
      });

      // Sync select all state based on individual checks
      const syncSelectAll = () => {
        const checks = list.find('input[type="checkbox"][data-name]');
        const allChecked =
          checks.length && checks.filter(":checked").length === checks.length;
        selectAll.prop("checked", allChecked);
      };
      list.on("change", 'input[type="checkbox"][data-name]', syncSelectAll);
      syncSelectAll();

      // Apply handler
      applyBtn.on("click", (e) => {
        e.preventDefault();
        e.stopPropagation();
        const selected = [];
        list
          .find('input[type="checkbox"][data-name]:checked')
          .each(function () {
            selected.push($(this).data("name"));
          });
        this.applyColumnSelection(selected);
        this.storeSelection(selected);
        // Close dropdown
        this.$el.find(".settings-container .btn-group").removeClass("open");
      });

      menu.append(list);
    },

    isColumnVisible: function (name) {
      // check cell visibility in first row
      const cell = this.$el.find(
        `.list table tbody tr:first-child td[data-name="${name}"]`
      );
      if (!cell.length) return true;
      return cell.is(":visible");
    },

    getStoredSelection: function () {
      try {
        const key = "cproduct.columns.visible";
        const stored = window.localStorage.getItem(key);
        if (stored) return JSON.parse(stored);
      } catch (e) {}
      // Return 'all' to indicate all columns should be selected by default
      return "all";
    },

    storeSelection: function (selectedNames) {
      try {
        const key = "cproduct.columns.visible";
        window.localStorage.setItem(key, JSON.stringify(selectedNames));
      } catch (e) {}
    },

    applyColumnSelection: function (selectedNames) {
      const setVisible = new Set(selectedNames);
      // header (skip first column and columns without data-name like actions)
      this.$el.find(".list table thead th").each(function (index) {
        const name = $(this).data("name");
        if (index === 0 || !name) return; // always show first column and action columns
        if (setVisible.has(name)) {
          $(this).show();
        } else {
          $(this).hide();
        }
      });
      // body rows (skip first column and cells without data-name)
      this.$el.find(".list table tbody tr").each(function () {
        $(this)
          .find("td")
          .each(function (index) {
            const name = $(this).data("name");
            if (index === 0 || name === "buttons") return; // always show first column and action cells
            if (setVisible.has(name)) {
              $(this).show();
            } else {
              $(this).hide();
            }
          });
      });

      // persist to local storage per scope
      try {
        const key = `cproduct.columns.visible`;
        window.localStorage.setItem(key, JSON.stringify(selectedNames));
      } catch (e) {}
    },

    afterRenderList: function () {
      // apply persisted selection
      try {
        const key = `cproduct.columns.visible`;
        const stored = window.localStorage.getItem(key);
        if (stored) {
          const selected = JSON.parse(stored);
          this.applyColumnSelection(selected);
        }
      } catch (e) {}
    },
  });
});
