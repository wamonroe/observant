const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  purge: [
    './app/views/**/*.html.erb'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Roboto', ...defaultTheme.fontFamily.sans]
      }
    }
  },
  plugins: [
    require('@tailwindcss/custom-forms')
  ]
}
