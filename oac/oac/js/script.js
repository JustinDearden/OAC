/*jshint jquery:true */

$(document).ready(function($) {
	"use strict";


	/*-------------------------------------------------*/
	/* Main isotope
	/*-------------------------------------------------*/

	var winDow = $(window);
	var $container=$('.iso-call');
	

	function isoFunction() {
		$container.isotope({
			layoutMode:'masonry',
			animationOptions:{
				duration:750,
				easing:'linear'
			}
		});
	}

	$container.imagesLoaded( function(){
		isoFunction();
	});

	winDow.on('resize', function(){
		isoFunction();
	});
	
	$('#container').addClass('active');
		
	/*-------------------------------------------------*/
	/* Explore tab list buttons click event
	/*-------------------------------------------------*/

	var listButton = $('.discover__list-item a');

	listButton.on('click', function(event){
		event.preventDefault();

		listButton.removeClass('active-list');
		$(this).addClass('active-list');

		var $this = $(this);

		if ( !$this.hasClass('place')) {
			$this.parents('.discover')
					.addClass('discover-events')
					.find('.places-tab')
					.fadeOut(200, function(){
						$this.parents('.discover')
								.find('.events-tab')
								.fadeIn(300);
					});
			
		} else {
			$this.parents('.discover')
					.removeClass('discover-events')
					.find('.events-tab')
					.fadeOut(200, function(){
						$this.parents('.discover')		
								.find('.places-tab')
								.fadeIn(300);
					});
		}
	});

	/*-------------------------------------------------*/
	/* Tabs block 
	/*-------------------------------------------------*/

	var tabsLink = $('.tabs-block__list-item a');

	tabsLink.on('click', function(event) {
		event.preventDefault();

		tabsLink.removeClass('active-list');
		$(this).addClass('active-list');

		var currentHashAtt = $(this).attr('href'),
			tabContentItem = $('.tabs-block__content-tab.active-tab'),
			currentTabContentItem = $(currentHashAtt);

		if( !currentTabContentItem.hasClass('active-tab') ) {
			tabContentItem.fadeOut(300, function() {
				$(this).removeClass('active-tab');
				currentTabContentItem.fadeIn(300, function() {
					$(this).addClass('active-tab');
				});
			});
		}

	});

	/*-------------------------------------------------*/
	/* Count increment
	/*-------------------------------------------------*/

	$('.statistic-post').appear(function() {
		$('.timer').countTo({
			speed: 4000,
			refreshInterval: 60,
			formatter: function (value, options) {
				return value.toFixed(options.decimals);
			}
		});
	});
	
	/*-------------------------------------------------*/
	/* OWL carousell
	/*-------------------------------------------------*/

	var owlWrap = $('.owl-wrapper');

	if (owlWrap.length > 0) {

		if (jQuery().owlCarousel) {
			owlWrap.each(function(){

				var carousel= $(this).find('.owl-carousel'),
					dataNum = $(this).find('.owl-carousel').attr('data-num'),
					dataNum2,
					dataNum3,
					dataNum4;

				if ( dataNum == 1 ) {
					dataNum2 = 1;
					dataNum3 = 1;
					dataNum4 = 1;
				} else if ( dataNum == 2 ) {
					dataNum2 = 2;
					dataNum3 = dataNum - 1;
					dataNum4 = dataNum - 1;
				} else if ( dataNum == 3 ) {
					dataNum2 = 3;
					dataNum3 = dataNum - 1;
					dataNum4 = dataNum3 - 1;
				} else {
					dataNum2 = dataNum - 1;
					dataNum3 = dataNum - 2;
					dataNum4 = dataNum - 3;
				}

				carousel.owlCarousel({
					autoPlay: 10000,
					navigation : true,
					items : dataNum,
					itemsDesktop : [1199,dataNum2],
					itemsDesktopSmall : [991,dataNum3],
					itemsTablet : [768, dataNum4],
					itemsMobile : [576, 1],
				});

			});
		}
	}
	
	/* ---------------------------------------------------------------------- */
	/*	Select2
	/* ---------------------------------------------------------------------- */

	$('.js-example-basic-multiple').select2();
	

	/*-------------------------------------------------*/
	/* scroll between sections
	/*-------------------------------------------------*/

	$('.navigate-section > li > a[href*=#], a.navigate-btn[href*=#]').on('click', function(event) {
		event.preventDefault();
		var dataOffset = 0;

		if ($(this).is("[data-offset]")) {
		    dataOffset = parseInt($(this).attr('data-offset'));
		}

		var offset = 90 - dataOffset;
		$('html, body').animate({
			scrollTop: $($(this).attr('href')).offset().top - offset
		}, 500, 'linear');
	});
	
	/*-------------------------------------------------*/
	/* Add active state in nav menu for active section
	/*-------------------------------------------------*/

	$('.element-waypoint').each(function() {
		var currentDiv = $(this);
		currentDiv.waypoint({
			handler: function(direction) {
				if( direction === 'down' ) {
					var containerID = currentDiv.attr('id');
					/* update navigation */
					$('.navigate-section > li > a').removeClass('active');
					$('.navigate-section > li > a[href*=#'+containerID+']').addClass('active');
				}
			},
			offset: '18%'
		});

		currentDiv.waypoint({
			handler: function(direction) {
				if( direction === 'up' ) {
					var containerID = currentDiv.attr('id');
					/* update navigation */
					$('.navigate-section > li > a').removeClass('active');
					$('.navigate-section > li > a[href*=#'+containerID+']').addClass('active');
				}
			},
			offset: '0'
		});
	});

	/* ---------------------------------------------------------------------- */
	/*	Contact Form
	/* ---------------------------------------------------------------------- */

	var submitContact = $('#submit_contact'),
		message = $('#msg');

	submitContact.on('click', function(e){
		e.preventDefault();

		var $this = $(this);
		
		$.ajax({
			type: "POST",
			url: 'contact.php',
			dataType: 'json',
			cache: false,
			data: $('#contact-form').serialize(),
			success: function(data) {

				if(data.info !== 'error'){
					$this.parents('form').find('input[type=text],textarea,select').filter(':visible').val('');
					message.hide().removeClass('alert-success').removeClass('alert-danger').addClass('alert-success').html(data.msg).fadeIn('slow').delay(5000).fadeOut('slow');
				} else {
					message.hide().removeClass('alert-success').removeClass('alert-danger').addClass('alert-danger').html(data.msg).fadeIn('slow').delay(5000).fadeOut('slow');
				}
			}
		});
	});

	/* ---------------------------------------------------------------------- */
	/*	Header animate after scroll
	/* ---------------------------------------------------------------------- */
	
	$(window).on('scroll', function() {
		if (document.documentElement.scrollTop > 100) {
			$("header").addClass('active');
		} else {
			$("header").removeClass('active');
		}
	});

	try {
		var scrollerOffset = $('.scroller-menu').offset().top;

		$(window).on('scroll', function() {
			if(document.documentElement.scrollTop > scrollerOffset) {
				$(".scroller-menu").addClass('active');
			} else {
				$(".scroller-menu").removeClass('active');
			}
		});
	} catch(err) {

	}

});

// resize triger function

function Resize() {
	$(window).trigger('resize');
}