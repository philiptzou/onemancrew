(function($) {
    
    function navbarControl() {
        $('.navbar').on('click', '.nav-toggle a', function(e) {
            var $this = $(this),
                $parent = $this.parent();
            $parent.toggleClass('open');
            if ($parent.hasClass('open')) {
                $this.parents('.navbar').find('.nav').addClass('show');
            } else {
                $this.parents('.navbar').find('.nav').removeClass('show');
            }
            e.preventDefault();
        });
    }

    function beforeLoad() {
        navbarControl();
    }

    function onReady() {
    }

    $(onReady);
    beforeLoad();
})(jQuery);
