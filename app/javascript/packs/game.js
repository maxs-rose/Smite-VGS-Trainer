
var challenge = {};
var score = 0;

$(document).ready(getChallenge())

var inputString = ""
$(document).on("keypress", function (e) {
    $("#challenge-display")[0].innerHTML = challenge.value
    if(e.which == 13)
    {
        getChallenge()
        clear()
        score = 0
        $("#score-display")[0].innerHTML = score
    }
    else if(e.which == 47)
    {
        $("#challenge-display")[0].innerHTML = `${challenge.combo} - ${challenge.value}`
    }
    else if(e.which == 32)
    {
        clear()
        score = 0
        $("#score-display")[0].innerHTML = score
    }
    else 
    {
        inputString += e.key   
        $.ajax({
        url: "/search?data=" + inputString,
        type: "get",
        success: function(data) { 
                $("#input-container")[0].innerHTML = inputString.toLowerCase()

                $("#option-list")[0].innerHTML = ""

                data.forEach(function(obj)
                {
                    $("#option-list").append(`<li>${obj.combo} - ${obj.value}</li>`)
                });

                if(data.length == 1 && data[0].combo == challenge.combo)
                {
                    for(var i = 0; i < 4; i++)
                    {
                        $("#input-container").addClass("highlight")

                        setTimeout(function() {
                            $("#input-container").removeClass("highlight") 
                        }, 100)
                    }
                    score++ 
                    $("#score-display")[0].innerHTML = score
                    getChallenge()
                    clear()
                }
            },
        error: function(data){
                score = 0
                $("#score-display")[0].innerHTML = score
                clear()
            }   
        });
    }
});

function clear()
{
    inputString = ""
    combo = {}
    $("#input-container")[0].innerHTML = "Input Command"
    $("#option-list")[0].innerHTML = ""
}

function getChallenge()
{
    $.ajax({
        url: "/challenge",
        type: "get",
        success: function(data)
        {
            challenge = data
            $("#challenge-display")[0].innerHTML = challenge.value
        }
    });
}