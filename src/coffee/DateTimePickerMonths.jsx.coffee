###* @jsx React.DOM ###

React = require 'react'
moment = require 'moment'

DateTimePickerMonths = React.createClass(

  propTypes:
    subtractYear: React.PropTypes.func.isRequired
    addYear: React.PropTypes.func.isRequired
    viewDate: React.PropTypes.object.isRequired
    selectedDate: React.PropTypes.object.isRequired
    showYears: React.PropTypes.func.isRequired
    setViewMonth: React.PropTypes.func.isRequired

  renderMonths: ->
    month = @props.selectedDate.month()
    monthsShort = moment.monthsShort()

    i = 0
    months = []
    while i < 12
      classes =
        month: true
        'active': i == month && @props.viewDate.year() == @props.selectedDate.year()
      months.push `<span className={React.addons.classSet(classes)} onClick={this.props.setViewMonth}>{monthsShort[i]}</span>`
      i++

    months

  render: ->
    `(
    <div className="datepicker-months" style={{display: 'block'}}>
          <table className="table-condensed">
            <thead>
              <tr>
                <th className="prev" onClick={this.props.subtractYear}>‹</th>

                <th className="switch" colSpan="5" onClick={this.props.showYears}>{this.props.viewDate.year()}</th>

                <th className="next" onClick={this.props.addYear}>›</th>
              </tr>
            </thead>

            <tbody>
              <tr>
                <td colSpan="7">{this.renderMonths()}</td>
              </tr>
            </tbody>
          </table>
        </div>
    )`

)

module.exports = DateTimePickerMonths