/**
 * =====================================================
 * CPRODUCT PANEL 2: SPECIFICATIONS VIEW
 * =====================================================
 *
 * Hiển thị thông tin kỹ thuật (specifications)
 * Fetch từ bảng c_product_specification
 * Quan hệ: 1-N (c_product has many c_product_specification)
 *
 * NOTE: Bảng chưa tồn tại, tạm thời hiển thị empty state
 */

define("custom:views/CProduct/record/detail-panel-specifications", [
  "view",
], function (Dep) {
  return Dep.extend({
    template: "custom:CProduct/record/detail-panel-specifications",

    data: function () {
      return {
        specifications: this.specifications || null,
        model: this.model || null,
        specificationId: this.specificationId || null,
        productName: this.model ? this.model.get("name") : null,
      };
    },

    /**
     * Initialize view
     */
    setup: function () {
      console.log("[CProductSpecification] Setup started");
      this.specifications = null;

      //in this entity code == name
      var productCode = this.model ? this.model.get("name") : null;
      if (!productCode) {
        console.log("[CProductSpecification] Missing product code, skip fetch");
        return;
      }

      this.loadSpecificationsByCode(productCode);
    },

    /**
     * After render
     */
    afterRender: function () {
      // Template sẽ tự động hiển thị empty state nếu không có data
      var self = this;
      this.$el.off("click", ".spec-name-link");
      this.$el.on("click", ".spec-name-link", function (e) {
        e.preventDefault();
        e.stopPropagation();
        if (self.specificationId) {
          var router = self.getRouter();
          router.navigate("#CSpecification/view/" + self.specificationId, {
            trigger: true,
          });
        }
      });

      // Button tạo mới specification khi không có dữ liệu
      this.$el.off("click", ".spec-create-btn");
      this.$el.on("click", ".spec-create-btn", function (e) {
        e.preventDefault();
        e.stopPropagation();
        var name = self.model ? self.model.get("name") : "";
        var url = "#CSpecification/create";
        if (name) {
          url += "?name=" + encodeURIComponent(name);
        }
        self.getRouter().navigate(url, { trigger: true });
      });
    },

    /**
     * Fetch CSpecification where name === product code
     */
    loadSpecificationsByCode: function (code) {
      var self = this;

      this.getCollectionFactory().create(
        "CSpecification",
        function (collection) {
          collection.maxSize = 1;
          collection.where = [
            {
              type: "equals",
              attribute: "name",
              value: code,
            },
          ];

          collection
            .fetch()
            .then(function () {
              if (!collection.length) {
                console.log(
                  "[CProductSpecification] No specification found for code",
                  code
                );
                self.specifications = null;
                self.render();
                return;
              }

              var specModel = collection.at(0);
              self.specificationId = specModel.id;
              self.specifications = self.buildSpecificationRows(specModel);
              self.render();
            })
            .catch(function (err) {
              console.error(
                "[CProductSpecification] Fetch error for code",
                code,
                err
              );
              self.specifications = null;
              self.render();
            });
        },
        this
      );
    },

    /**
     * Chuyển model CSpecification thành danh sách fieldName/fieldValue để render bảng
     */
    buildSpecificationRows: function (specModel) {
      var fields = this.getSpecificationFieldList();

      var list = [];
      fields.forEach(
        function (field) {
          var value = specModel.get(field);
          if (value === undefined || value === null || value === "") return;

          list.push({
            fieldName: this.translate(field, "fields", "CSpecification"),
            fieldValue: value,
            isNameField: field === "name",
          });
        }.bind(this)
      );

      // Nếu không có field nào, trả về null để hiện empty state
      return list.length ? list : null;
    },

    /**
     * Lấy danh sách field của CSpecification từ metadata, bỏ qua các field hệ thống
     */
    getSpecificationFieldList: function () {
      var metaFields = this.getMetadata().get("entityDefs.CSpecification.fields") || {};
      var skip = new Set([
        "id",
        "createdAt",
        "modifiedAt",
        "createdBy",
        "modifiedBy",
        "assignedUser",
        "teams",
      ]);

      var names = Object.keys(metaFields).filter(function (k) {
        return !skip.has(k);
      });

      // Đưa name lên đầu nếu tồn tại
      names.sort();
      if (names.includes("name")) {
        names = ["name"].concat(names.filter(function (n) { return n !== "name"; }));
      }

      return names;
    },
  });
});
