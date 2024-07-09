# Benjamin coding challenge

Welcome to Benjamin coding skill challenge for Flutter engineers.

## Brief

This repository contains boilerplate Flutter app and a custom TextFormField class
called `CustomTextFormField`. This challenge is designed to test your 
understanding of Flutter widgets, state management, asynchronous programming and API integration.

The challenge is split to several different goals described below.

## Goals

1. **Autocomplete**: Improve CustomTextFormField widget to support autocomplete options. 
   Use this functionality in the first street address field. The widget should display
   list of hardcoded address suggestions when user has typed 2 or more characters.
   When field contains less than 2 characters, the field should not display any suggestions. done

2. **Autocomplete selection**: When user taps the autocomplete suggestion, the form should
   update all relevant fields from the address object. done

3. **Form validation**: Implement simple form validation rules for text fields in the form.
   User should fill all the fields to consider the form being valid. done

4. **API integration**: Simulate real world scenario where addresses are fetched from
   external API. For simplicity, the delay to get address suggestions can be set 1 second.

## Bonus goals

1. **Debounce**: Implement debounce functionality for the autocomplete field. The field
   should wait for 300ms before sending the request to the API. Whenever user types again
   to the field, the timer should reset.

2. **Form fields** Improve form fields to limit the input length and characters allowed
   based on general USA address standards.

3. **Address state selection** Modify CustomTextFormField to support drop down options or
   create a new similar looking widget. Use this widget to select the state. To get list of
   US states, following library can be used: https://pub.dev/packages/us_states

4. **Error handling**: Implement error handling for the API request. Simulate error
   scenario when user types "error" to the autocomplete field. Use your best judgement on
   how to display the error message to the user.

5. **Submit form**: Implement form submission functionality. When user has filled all the
   fields and taps the submit button when form is valid, display loading indicator for 2 seconds
   and simple success message to the user that their address has been successfully updated.

6. **Keyboard** Improve keyboard visibility functionality e.g. when user taps outside the fields, 
   the keyboard should hide.