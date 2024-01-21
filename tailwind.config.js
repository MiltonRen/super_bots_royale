const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [
    require("@tailwindcss/typography"),
    require("daisyui")
  ],
  daisyui: {
    themes: true, // true: all themes | false: only light + dark | array: specific themes like this ["light", "dark", "cupcake"]
    base: true, // applies background color and foreground color for root element by default
    styled: true, // include daisyUI colors and design decisions for all components
    utils: true, // adds responsive and modifier utility classes
    rtl: false, // rotate style direction from left-to-right to right-to-left. You also need to add dir="rtl" to your html tag and install `tailwindcss-flip` plugin for Tailwind CSS.
    prefix: "", // prefix for daisyUI classnames (components, modifiers and responsive class names. Not colors)
    logs: true, // Shows info about daisyUI version and used config in the console when building your CSS
  },
  theme: {
    screens: {
      'xs': '360px',
      'sm': '640px',
      'md': '768px',
      'lg': '1024px',
      'xl': '1280px',
      '2xl': '1536px',
    },
    extend: {
      lineClamp: {
        7: '7',
        8: '8',
        9: '9',
        10: '10',
        11: '11',
        12: '12',
      },
      fontFamily: {
        // These fonts are currently loaded by CDN in application.html.erb > head
        // To change default font, edit application.tailwind.css > font-family
        sans: ['Silkscreen', ...defaultTheme.fontFamily.sans],
        serif: ['Silkscreen', ...defaultTheme.fontFamily.serif],
      },
      keyframes: {
        appear_1: {
          '0%':   { opacity: 0, transform: 'translateY(-10%);' },
          '3%':   { opacity: 0, transform: 'translateY(-10%);' },
          '8%':   { opacity: 1, transform: 'translateY(0%);' },
          '100%': { opacity: 1, transform: 'translateY(0%);' },
        },
        appear_2: {
          '0%':   { opacity: 0, transform: 'translateY(-10%);' },
          '15%':  { opacity: 0, transform: 'translateY(-10%);' },
          '20%':  { opacity: 1, transform: 'translateY(0%);' },
          '100%': { opacity: 1, transform: 'translateY(0%);' },
        },
        appear_3: {
          '0%':   { opacity: 0, transform: 'translateY(-10%);' },
          '25%':  { opacity: 0, transform: 'translateY(-10%);' },
          '30%':  { opacity: 1, transform: 'translateY(0%);' },
          '100%': { opacity: 1, transform: 'translateY(0%);' },
        },
        appear_4: {
          '0%':   { opacity: 0, transform: 'translateY(-10%);' },
          '35%':  { opacity: 0, transform: 'translateY(-10%);' },
          '40%':  { opacity: 1, transform: 'translateY(0%);' },
          '100%': { opacity: 1, transform: 'translateY(0%);' },
        },
        appear_5: {
          '0%':   { opacity: 0, transform: 'translateY(-10%);' },
          '45%':  { opacity: 0, transform: 'translateY(-10%);' },
          '50%':  { opacity: 1, transform: 'translateY(0%);' },
          '100%': { opacity: 1, transform: 'translateY(0%);' },
        },
        appear_6: {
          '0%':   { opacity: 0, transform: 'translateY(-10%);' },
          '55%':  { opacity: 0, transform: 'translateY(-10%);' },
          '60%':  { opacity: 1, transform: 'translateY(0%);' },
          '100%': { opacity: 1, transform: 'translateY(0%);' },
        },
        appear_7: {
          '0%':   { opacity: 0, transform: 'translateY(-10%);' },
          '65%':  { opacity: 0, transform: 'translateY(-10%);' },
          '70%':  { opacity: 1, transform: 'translateY(0%);' },
          '100%': { opacity: 1, transform: 'translateY(0%);' },
        },
        appear_8: {
          '0%':   { opacity: 0, transform: 'translateY(-10%);' },
          '75%':  { opacity: 0, transform: 'translateY(-10%);' },
          '80%':  { opacity: 1, transform: 'translateY(0%);' },
          '100%': { opacity: 1, transform: 'translateY(0%);' },
        },
        appear_9: {
          '0%':   { opacity: 0, transform: 'translateY(-10%);' },
          '85%':  { opacity: 0, transform: 'translateY(-10%);' },
          '90%':  { opacity: 1, transform: 'translateY(0%);' },
          '100%': { opacity: 1, transform: 'translateY(0%);' },
        },
        floating: {
          '0%':   { transform: 'translate(0, 0)' },
          '50%':  { transform: 'translate(0, -0.5rem)' },
          '100%': { transform: 'translate(0, 0)' },
        },
        fading_in: {
          '0%':   { opacity: 0, transform: 'translateY(-10%);' },
          '100%': { opacity: 1, transform: 'translateY(0%);' },
        },
        fading_in_from_below: {
          '0%':   { opacity: 0, transform: 'translateY(10%);' },
          '100%': { opacity: 1, transform: 'translateY(0%);' },
        },
        jump_twice: {
          '10%':   { transform: 'scale(1,1) translateY(0);' },
          '20%':   { transform: 'scale(1,1) translateY(-10%) scaleX(0.95);' },
          '30%':   { transform: 'scale(1,1) translateY(0) scaleX(1.05);' },
          '40%':  { transform: 'scale(1,1) translateY(-10%) scaleX(0.95);' },
          '50%':  { transform: 'scale(1,1) translateY(0) scaleX(1.05);' },
          '100%': { transform: 'scale(1,1) translateY(0);' },
        },
        just_fade_in: {
          '0%':   { opacity: 0 },
          '100%': { opacity: 1 },
        },
        wave: {
          '0%':  { transform: 'rotate(0.0deg)' },
          '5%': { transform: 'rotate(14deg)' },
          '10%': { transform: 'rotate(-8deg)' },
          '15%': { transform: 'rotate(14deg)' },
          '20%': { transform: 'rotate(-4deg)' },
          '25%': { transform: 'rotate(10.0deg)' },
          '30%': { transform: 'rotate(0.0deg)' },
          '100%': { transform: 'rotate(0.0deg)' },
        },
      },
      animation: {
        'appear-1': 'appear_1 10s',
        'appear-2': 'appear_2 10s',
        'appear-3': 'appear_3 10s',
        'appear-4': 'appear_4 10s',
        'appear-5': 'appear_5 10s',
        'appear-6': 'appear_6 10s',
        'appear-7': 'appear_7 10s',
        'appear-8': 'appear_8 10s',
        'appear-9': 'appear_9 10s',
        'floating-twice': 'floating 2s ease-out',
        'floating-always': 'floating 5s infinite ease-out',
        'fading-in': 'fading_in 1s ease-in-out',
        'fading-in-from-below': 'fading_in_from_below 1s ease-in-out',
        'jump-small': 'jump_twice 2s',
        'fade-in-forwards': 'just_fade_in 1.5s ease forwards',
        'waving-hand': 'wave 4s linear infinite',
      },
    },
  },
}
