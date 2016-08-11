$(document).ready(function()
{
    // open notification center on click
    $("#open_notification").click(function()
    {
        $("#notificationContainer").fadeToggle(300);
        $("#notification_count").fadeOut("fast");
        return false;
    });

    // hide notification center on click
    $(document).click(function()
    {
        $("#notificationContainer").hide();
    });


    $("#notificationContainer").click(function()
    {
        return false;
    });

});