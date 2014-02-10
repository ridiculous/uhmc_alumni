jQuery(function ($) {

    $(document).ready(function () {

        init_new_user_views();
        init_password_helper();
        init_user_search();
        init_work_present();
        init_tabslide();
        init_clearform();
        init_school_helper();
        init_remote_cancel();
        init_ajax_forms();

    });

    function init_ajax_forms() {
        $('#close_form').live('click', function () {
            f.fire_cancel();
        });
        var place_holder = $('<div id="notice_place_holder" />');
        place_holder.insertBefore('#begin_content');

        $('#alumni_form')
            .live("ajax:beforeSend", function (evt, xhr, settings) {
                var $submitButton = $(this).find('input[name="commit"]');
                // Update the text of the submit button to let the user know stuff is happening.
                // But first, store the original text of the submit button, so it can be restored when the request is finished.
                $submitButton.data('origText', $(this).text());
                $submitButton.text("Submitting...");

            })
            .live("ajax:success", function (evt, data, status, xhr) {
                var $form = $(this), form_class = $form.attr('class'), raw_response = xhr.responseText, json_response;
                var wrapper = $('<div id="notice_content"><div class="flash info"><div class="header"></div></div></div>');
                try {
                    json_response = $.parseJSON(raw_response);
                } catch (e) {
                }
                // Reset validation errors, so form can be used again, but leave hidden_field values intact.
                $form.find('div.list-form-errors').empty().hide();
                if ($('div.field_with_errors').length)$('div.field_with_errors').children().unwrap('<div class="field_with_errors" />');

                if (form_class == 'new_alumni') {
                    f.fire_cancel();
                    $('.header', wrapper).html("Record successfully created");
                    $('#admin_header').hide().slideDown();

                    place_holder.html(wrapper).slideDown('fast', function () {
                        if ($('table#alumni_list_table').length) {
                            var $r = $(raw_response);
                            $r.addClass('loaded');
                            $r.insertAfter('#alumni_list_table tr:first');
                            $('#alumni_list_table .loaded').hide();
                            setTimeout(function () {
                                $('#alumni_list_table .loaded').fadeIn();
                            }, 1000);
                        } else {

                        }
                    });

                    setTimeout(function () {
                        $('#notice_content').slideUp(400, function () {
                            $(this).remove();
                        });
                    }, 4000);
                } else {
                    $('.header', wrapper).html(json_response.msg);
                    $('#admin_header').hide().slideDown();
                    place_holder.html(wrapper).slideDown();
                    setTimeout(function () {
                        $('#notice_content').slideUp(400, function () {
                            $(this).remove();
                        });
                    }, 4000);
                }
            })
            .live('ajax:complete', function (evt, xhr, status) {
                var $submitButton = $(this).find('input[name="commit"]');

                // Restore the original submit button text
                $submitButton.text($(this).data('origText'));
            })
            .live("ajax:error", function (evt, xhr, status, error) {
                $('.list-form-errors', this).hide().html(xhr.responseText).slideDown();
            });
    }

    function init_remote_cancel() {
        $('#cancel_link_alumnis').live('click', function () {
            if ($('#cancel_link_alumnis').parents('.new-js-wrap').length) {
                f.fire_cancel()
                return false;
            }
        });

    }

    var f = {
        fire_cancel:function () {
            var jswrap = $('#cancel_link_alumnis').parents('.new-js-wrap');
            if (jswrap.length) {
                jswrap.slideUp(500, function () {
                    $(this).remove();
                    if ($('#close_form').length) $('#close_form').remove();
                    // open class is set in alumnis/new.js.erb
                    $('#new_alumni_link').removeClass('open').fadeIn();
                });
            }
        }
    }

    function init_school_helper() {
        if (!$('.clickhere').length) {
            return;//exit function
        }
        var original = $('.clickhere');
        original.bind('click', function () {
            var other = $(this).attr("id") != '_cancel' ? $('#other' + $(this).attr("id")) : 'cancel',
                wrap = $(this).parent().attr('id'), pro = $('#school' + $(this).attr("id") + '_name'), menu;
            if (other === 'cancel') {
                $('#' + wrap).slideUp(function () {
                    $('#school_' + wrap).val('');
                    $('#school' + wrap.substring(wrap.search("_")) + '_name').removeAttr("disabled");
                });
            } else {
                pro.attr("disabled", "disabled");
                other.slideDown();
            }
        });
    }

    function init_clearform() {
        if (!$('#clearBtn').length) {
            return;//exit
        }
        $('#clearBtn').bind('click', function () {
            $('#users_search').val('').focus();
            $('#cat').val('name')
        });
    }

    function init_tabslide() {
        var tab;
        $('.nav-links a').bind('mouseover',
            function () {
                tab = "#" + $(this).parent().attr("id") + "_tab"
                $(tab).show();
            }).bind('mouseout', function () {
                $(tab).hide();
            });
    }

    //Function to switch admin/alumni view for new user
    function init_new_user_views() {
        if (!$('#_admin').length || !$('#_alumni').length) {
            return;
        }
        //Grab elements used primarily by the helper methods below
        var alumni = $('#alumni-user'), admin = $('#admin-user'),
            alum_result = alumni.find('#pw_helper'), admin_result = admin.find('#pw_helper'),
            alum_result_confirm = alumni.find('#confirm_pw_helper'), admin_result_confirm = admin.find('#confirm_pw_helper'),
            alum_pw = alumni.find("#new_password_field"), admin_pw = admin.find("#new_password_field"),
            alum_confirm = alumni.find('#new_password_confirm_field'), admin_confirm = alumni.find('#new_password_confirm_field');
        //Toggle on password helper for alumni form and unbind() admin form (hidden)
        alumni_pw_helper();
        $('#_admin:checked').live('click', function () {
            clear_error_fields();
            alumni.hide();
            admin_pw_helper();
            admin.show("show");
            $('#admin_role').attr("value", "admin");
            $('#alumni_role').attr("value", "");
        });
        $('#_alumni:checked').live('click', function () {
            clear_error_fields();
            admin.hide();
            alumni_pw_helper();
            alumni.show("show");
            $('#alumni_role').attr("value", "alumni");
            $('#admin_role').attr("value", "");
        });

        function admin_pw_helper() {
            admin_pw.unbind().addClass("admin_new_pw")
            $('.admin_new_pw').bind('keyup', function () {
                set_helper(admin_result, admin_pw.val().length);
            });
            admin_confirm.unbind().addClass("admin_confirm_pw")
            $('.admin_confirm_pw').bind('keyup', function () {
                check_match(admin_pw.val(), admin_confirm, admin_result_confirm)
            });
        }

        function alumni_pw_helper() {
            alum_pw.unbind().addClass("alum_new_pw")
            $('.alum_new_pw').bind('keyup', function () {
                set_helper(alum_result, alum_pw.val().length);
            });
            alum_confirm.unbind().addClass("alum_confirm_pw")
            $('.alum_confirm_pw').bind('keyup', function () {
                check_match(alum_pw.val(), alum_confirm, alum_result_confirm)
            });
        }
    }

    function init_password_helper() {
        if (!$('#new_password_field').length || !$('#new_password_confirm_field').length) {
            return;//exit
        }
        $('#new_password_field').bind('keyup', function () {
            set_helper($('#pw_helper'), $('#new_password_field').val().length);
        });
        $('#new_password_confirm_field').bind('keyup', function () {
            check_match($('#new_password_field').val(), $('#new_password_confirm_field'), $('#confirm_pw_helper'))
        });
    }

    function set_helper(results, pw_length) {
        var helper = $(results), txt, ac, rc;
        if (pw_length > 1) {
            if (pw_length < 6) {
                txt = "Password is too short", rc = "good-enough", ac = "too-short";
            } else if (pw_length > 8) {
                txt = "Excellent!", rc = "too-short", ac = "good-enough";
            } else {
                txt = "That's good", rc = "too-short", ac = "good-enough";
            }
            helper.html(txt).removeClass(rc).addClass(ac);
        } else if (pw_length == 0)
            helper.empty();
    }

    function check_match(pw, conf_pw, result) {
        var conf_helper = $(result), txt, ac, rc;
        if (conf_pw.val().length > 1) {
            if (pw == conf_pw.val()) {
                txt = "Confirmed", rc = "too-short", ac = "good-enough";
            } else {
                txt = "Not a match", rc = "good-enough", ac = "too-short";
            }
            conf_helper.html(txt).removeClass(rc).addClass(ac);
        } else if (conf_pw.val().length == 0)
            conf_helper.empty();
    }

    function init_user_search() {
        if (!$('#find-user-button').length) {
            return;//exit
        }
        $('#find-user-button').bind('click', function () {
            $('#user-search-button-span').fadeOut();
            $('#user-search-div').show("slow", function () {
                $('#users-search-field').focus();
            });
        });
    }

    function clear_error_fields() {
        if ($('#error_explanation').length) {
            $('#error_explanation').hide();
        }
        $('#admin-user div, #alumni-user div').each(function () {
            $(this).removeClass("field_with_errors");
        });
    }

    function init_work_present() {
        if (!$('#employment_work_present').length) {
            return;//exit
        } else {
            if ($('#employment_work_present').attr('checked') == true) {
                blurout($('#end-date-tag'));
                $('#employment_end_date_1i, #employment_end_date_2i, #employment_end_date_3i').attr('disabled', 'disabled');
            } else {
                $('#to-present-tag').css('color', 'grey');
            }
            $('#employment_work_present').bind('click', function () {
                if ($('#employment_work_present').attr('checked') == true) {
                    blurout($('#end-date-tag'));
                    showoff($('#to-present-tag'));
                    $('#employment_end_date_1i, #employment_end_date_2i, #employment_end_date_3i').attr('disabled', 'disabled');
                } else {
                    $('#employment_end_date_1i, #employment_end_date_2i, #employment_end_date_3i').removeAttr('disabled');
                    showoff($('#end-date-tag'));
                    $('#to-present-tag').css('color', 'grey');
                }
            });
        }
        function blurout(t) {
            $(t).css({
                'color':'grey',
                'text-decoration':'line-through'
            });
        }

        function showoff(t) {
            $(t).css({
                'color':'black',
                'text-decoration':'none'
            });
        }
    }

    function capFirst(string) {
        var s = string.split(' '), r = '';
        $(s).each(function () {
            r += this.charAt(0).toUpperCase() + this.toLowerCase().slice(1) + ' ';
        });
        return r;
    }
});