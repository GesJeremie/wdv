(function() {
    'use strict';

    var Controller = new Class({

        extends: Stimulus.Controller,

        static: {
            targets: ['totalPrice']
        },

        /**
         * Ajax Requests
         */

        requests: {
            cart: function () {
                return $.get('/cart.json');
            },
        },

        /**
         * Boot
         */

        initialize: function () {
            this.setupEvents();
        },

        setupEvents: function () {
            $(document).on('cartTotalPrice:refresh', this.onCartTotalPriceRefresh.bind(this));
        },

        /**
         * Events
         */

        onCartTotalPriceRefresh: function () {
            this.requests.cart().done(function (response) {
                this.renderTotalPrice(response.total_price_humanize);
            }.bind(this));
        },

        /**
         * Methods
         */

        renderTotalPrice: function (totalPrice) {
            this.totalPriceTarget.innerHTML = totalPrice;
        }
    });

    window.app.stimulus.register('cartTotalPrice', Controller);
}());
