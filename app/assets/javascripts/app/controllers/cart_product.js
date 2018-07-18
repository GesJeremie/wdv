(function() {
    'use strict';

    var Controller = new Class({

        extends: Stimulus.Controller,

        static: {
            targets: ['quantity', 'totalPrice']
        },

        /**
         * Ajax Requests
         */

        requests: {
            updateCartProduct: function (data, cart_products) {
                return $.post('/cart_products/' + data.get('id') + '.json', {
                    _method: 'put',
                    cart_products: cart_products
                });
            },

            updateCartProductQuantity: function (data, quantity) {
                return this.updateCartProduct(data, {
                    quantity: quantity
                });
            },

            deleteCartProduct: function (data) {
                return $.post('/cart_products/' + data.get('id') + '.json', {
                    _method: 'delete'
                });
            }
        },

        /**
         * Boot
         */

        initialize: function () {
            this.requests.parent = this;
        },

        /**
         * Events
         */

        onClickLessQuantity: function () {
            var quantity = parseInt(this.data.get('quantity')) - 1;

            if (quantity === 0) { return; }

            this.updateQuantity(quantity);
        },

        onClickMoreQuantity: function () {
            var quantity = parseInt(this.data.get('quantity')) + 1;

            this.updateQuantity(quantity);
        },

        onClickRemove: function () {
            this.requests.deleteCartProduct(this.data).done(function () {
                window.location.reload();
            });
        },

        /**
         * Methods
         */

        updateQuantity: function (quantity) {
            this.requests.updateCartProductQuantity(this.data, quantity).done(function (response) {
                this.data.set('quantity', parseInt(response.quantity));
                this.renderQuantity();
                this.renderTotalPrice(response.total_price_humanize);
                $(document).trigger('headerCart:refresh');
                $(document).trigger('cartTotalPrice:refresh');
            }.bind(this));
        },

        renderQuantity: function () {
            this.quantityTarget.innerHTML = this.data.get('quantity');
        },

        renderTotalPrice: function (totalPrice) {
            this.totalPriceTarget.innerHTML = totalPrice;
        }
    });

    window.app.stimulus.register('cartProduct', Controller);
}());
