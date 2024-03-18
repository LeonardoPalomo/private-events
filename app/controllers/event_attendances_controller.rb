class EventAttendancesController < ApplicationController

  def new
    @event_attendance = EventAttendance.new
  end

  def show
  end

  def create

    @event = Event.find(params[:event_id])
    @event_attendance = EventAttendance.new
    @event_attendance.attended_event = @event
    @event_attendance.event_attendee = current_user

    if @event_attendance.save
      redirect_to event_url(@event), notice: "Subscription added."
    else
      render :new, status: :unprocessable_entity
    end

  end

  # Only allow a list of trusted parameters through.
  def event_attendance_params
    params.require(:event_attendance).permit(:event_id)
  end

end
