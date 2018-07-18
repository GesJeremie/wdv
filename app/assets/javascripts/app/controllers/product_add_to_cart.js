(function() {
    'use strict';

    var Controller = new Class({

        extends: Stimulus.Controller,

        static: {
            targets: ['totalPrice', 'quantity', 'dosageInfo', 'addedMessage']
        },

        quantity: 1,

        requests: {
            createCartProduct: function (data, quantity) {
                return $.post('/cart_products.json', {
                    cart_products: {
                        product_id: data.get('productId'),
                        quantity: quantity
                    }
                });
            }
        },

        /**
         * Boot
         */

        initialize: function () {
            this.render();
        },

        /**
         * Events
         */

        onClickPlus: function () {
            this.quantity++;
            this.render();
        },

        onClickMinus: function () {
            if (this.quantity <= 1) { return; }

            this.quantity--;
            this.render();
        },

        onClickAddToCart: function () {
            this.requests.createCartProduct(this.data, this.quantity).done(function (response) {
                this.renderAddedMessage();
                $(document).trigger('headerCart:refresh');
            }.bind(this));
        },

        /**
         * Methods
         */

        calculateDosage: function (type) {
            return parseInt(this.data.get(type)) * this.quantity;
        },

        getTotal: function () {
            return (this.quantity * parseInt(this.data.get('unitPriceInCents'))) / 100;
        },

        getTotalDosageJoints: function () {
            return calculateDosage('dosageJoints');
        },

        getTotalDosageBowls: function () {
            return calculateDosage('dosageBowls');
        },

        render: function () {
            this.renderTotalPrice();
            this.renderQuantity();
            this.renderDosage();
        },

        renderTotalPrice: function () {
            var total = this.getTotal();

            this.totalPriceTarget.innerHTML = '$' + total;
        },

        renderQuantity: function () {
            this.quantityTarget.innerHTML = this.quantity;
        },

        renderDosage: function () {
            if (this.data.get('dosageInfo') === 'false') { return; }

            this.dosageInfoTarger.innerHTML = this.tplDosage();
        },

        renderAddedMessage: function () {
            this.addedMessageTarget.innerHTML = this.tplAddedMessage();
        },

        /**
         * Templates
         */

        tplAddedMessage: function () {
            return '<img class="product-summary__fuck-yeah" src="' + this.data.get('gif') + '" /> <br/> <strong>' + this.quantity + ' units</strong> of <strong>' + this.data.get('name') + '</strong> has been <a href="/order">added to your cart</a>.';
        },

        tplDosage: function () {
            var dosageJoints = this.getTotalDosageJoints(),
                dosageBowls = this.getTotalDosageBowls();

            return 'Enough for about ' + dosageJoints + ' joints or ' + (dosageBowls - 1) + ' - ' + dosageBowls + ' bowls';
        }
    });

    window.app.stimulus.register('productAddToCart', Controller);
}());
