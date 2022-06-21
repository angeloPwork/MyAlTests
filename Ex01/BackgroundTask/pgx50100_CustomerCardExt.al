pageextension 50115 CustomerCardExt extends "Customer Card"
{
    layout
    {
        addlast(General)
        {

            field(starttime; starttime)
            {
                ApplicationArea = All;
                Caption = 'Start Time';
                Editable = false;
            }

            field(durationtime; durationtime)
            {
                ApplicationArea = All;
                Caption = 'Duration';
                Editable = false;
            }

            field(endtime; endtime)
            {
                ApplicationArea = All;
                Caption = 'End Time';
                Editable = false;
            }
        }
    }

    var
        // Global variable used for the TaskID
        WaitTaskId: Integer;

        // Variables for the three fields on the page 
        starttime: Text;
        durationtime: Text;
        endtime: Text;

    trigger OnAfterGetCurrRecord()
    var
        //Defines a variable for passing parameters to the background task
        TaskParameters: Dictionary of [Text, Text];
    begin
        //TaskParameters.Add('Wait', '1000');
        TaskParameters.Add('Wait', '100');

        CurrPage.EnqueueBackgroundTask(WaitTaskId, Codeunit::PBTWaitCodeunit, TaskParameters, 1000, PageBackgroundTaskErrorLevel::Warning);
    end;

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    var
        started: Text;
        waited: Text;
        finished: Text;
        PBTNotification: Notification;
    begin
        if (TaskId = WaitTaskId) then begin
            Evaluate(started, Results.Get('started'));
            Evaluate(waited, Results.Get('waited'));
            Evaluate(finished, Results.Get('finished'));

            starttime := started;
            durationtime := waited;
            endtime := finished;
            PBTNotification.Message('Start and finish times have been updated.');
            PBTNotification.Send();
        end;
    end;

    trigger OnPageBackgroundTaskError(TaskId: Integer; ErrorCode: Text; ErrorText: Text; ErrorCallStack: Text; var IsHandled: Boolean)
    var
        PBTErrorNotification: Notification;
    begin
        if (ErrorCode = 'ChildSessionTaskTimeout') then begin
            IsHandled := true;
            PBTErrorNotification.Message('Something went wrong. The start and finish times haven''t been updated.');
            PBTErrorNotification.Send();
        end

        else
            if (ErrorText = 'Child Session task was terminated because of a timeout.') then begin
                IsHandled := true;
                PBTErrorNotification.Message('It took too long to get results. Try again.');
                PBTErrorNotification.Send();
            end
    end;
}