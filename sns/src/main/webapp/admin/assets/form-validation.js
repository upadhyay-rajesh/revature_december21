var FormValidation = function () {

    var handleValidation1 = function() {
        // for more info visit the official plugin documentation: 
            // http://docs.jquery.com/Plugins/Validation

            var form1 = $('#form_sample_1');
            var error1 = $('.alert-error', form1);
            var success1 = $('.alert-success', form1);

            form1.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-inline', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "",
                rules: {
                    "user_name":
                        {
                            required: true,
                            minlength: 3,
                            maxlength: 9
                        },
                "user_pass":
                        {
                            minlength: 3,
                            maxlength: 15
                        },
                "user_confirm_pass":
                        {
                            equalTo: "#password"
                        },
                "institute_name":
                        {
                            minlength: 3,
                            maxlength: 30
                        },
                "institute_address":
                        {
                            minlength: 3,
                            maxlength: 50
                        },
                "institute_city":
                        {
                            minlength: 3,
                            maxlength: 20
                        },
                "institute_country":
                        {
                            minlength: 3,
                            maxlength: 20
                        },
                "institute_tel":
                        {
                            required: true,
                            digits: true,
                            minlength: 11,
                            maxlength: 11
                        },
                        "institute_mob":
                        {
                            digits: true,
                            minlength: 10,
                            maxlength: 10
                        },
                        "institute_fax":
                        {
                            digits: true,
                            minlength: 11,
                            maxlength: 11
                        },
                        "user_sanswer":
                        {
                            required: true,
                            minlength: 3,
                            maxlength: 9
                        },
                        "user_firstname":
                                {
                                    minlength: 3,
                                    maxlength: 15
                                },
                        "user_lastname":
                                {
                                    minlength: 3,
                                    maxlength: 15
                                },
                        "user_currentcity":
                                {
                                    minlength: 3,
                                    maxlength: 10
                                }
            },
            messages:
                    {
                        "institute_tel":
                                {
                                    minlength: "Invalid Telephone Number",
                                    maxlength: "Invalid Telephone Number"
                                },
                        "institute_email":
                                {
                                    email: "Invalid Email"
                                },
                        "user_pass":
                                {
                                    equalTo: "Passwords MUST match"
                                }
                },

                invalidHandler: function (event, validator) { //display error alert on form submit              
                    success1.hide();
                    error1.show();
                    FormValidation.scrollTo(error1, -200);
                },

                highlight: function (element) { // hightlight error inputs
                    $(element)
                        .closest('.help-inline').removeClass('ok'); // display OK icon
                    $(element)
                        .closest('.control-group').removeClass('success').addClass('error'); // set error class to the control group
                },

                unhighlight: function (element) { // revert the change done by hightlight
                    $(element)
                        .closest('.control-group').removeClass('error'); // set error class to the control group
                },

                success: function (label) {
                    label
                        .addClass('valid').addClass('help-inline ok') // mark the current input as valid and display OK icon
                    .closest('.control-group').removeClass('error').addClass('success'); // set success class to the control group
                },

                /*submitHandler: function (form) {
                    success1.show();
                    error1.hide();
                }*/
            });
    }

    return {
        //main function to initiate the module
        init: function () {

            handleValidation1();

        },

	// wrapper function to scroll to an element
        scrollTo: function (el, offeset) {
            pos = el ? el.offset().top : 0;
            jQuery('html,body').animate({
                    scrollTop: pos + (offeset ? offeset : 0)
                }, 'slow');
        }

    };

}();