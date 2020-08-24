import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = [ "input" ]

  get(event) {
    event.preventDefault()

    let params = this.getParams()
    Rails.ajax({
      type: "POST", 
      url: this.data.get('url'),
      data: params,
      success: response => {
        this.renderResponse(response)
      },
      error: response => {
        this.renderResponse(response)
      }
    })
  }

  getParams() {
    let params = {}
    this.inputTargets.forEach(input => {
      // Rails.serializeElement(Rails.$("form")[0]) 
      // get values
      let name = input.getAttribute('name')
      let model = name.match(/^[^\[]+/)[0]
      let attribute = name.replace(/^[^\[]+\[([^\]]+)\]$/, '$1')
      let value = input.value

      // make sure the model is an object
      params[model] = params[model] || {}

      // add the attribute and value
      if (params.hasOwnProperty(attribute)) {
        if (Array.isArray(params[attribute])) {
          params[model][attribute].push(value)
        } else {
          params[model][attribute] = [params[model][attribute], value]
        }
      } else {
        params[model][attribute] = value
      }
    })
    return params
  }

  renderResponse(response) {
    console.log(response)
  }
}
