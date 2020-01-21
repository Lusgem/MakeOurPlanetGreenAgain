const search_input = $("#search-input-user")
const projects_div = $("#users-div")
const endpoint = '/search_users/'
const delay = 100
let scheduled_function = false

let ajax_call = function(endpoint, request_parameters) {
    $.getJSON(endpoint, request_parameters)
        .done(response => {
            projects_div.fadeTo('fast',0).promise().then(() => {
                projects_div.html(response['html_from_view'])
                projects_div.fadeTo('fast',1)
            })
        })
}

search_input.on('keyup', function() {
    const request_parameters = {
        q: $(this).val() //valeur de search_input
    }

    if (scheduled_function) {
        clearTimeout(scheduled_function)
    }

    scheduled_function = setTimeout(ajax_call, delay, endpoint, request_parameters)
})
