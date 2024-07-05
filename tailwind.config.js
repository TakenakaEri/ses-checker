module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/**/*.{erb,html,rb}'
  ],
  
  theme: {
    extend: {
      // 色の指定
      colors: {
        teal: '#41AFA5',
        mint: '#1DE595',
        customBlue: '#27D3EC',
        'ses': {
          'cyan': '#00E0FF',
          'blue': {
            light: '#01B7E0',
            middle: '#0365B9',
            dark: '#124468',
          },
          'indigo': '#025DEA',
        },
        'neutral': {
          100: '#F5F5F5',
          200: '#E8E8E8',
        },
      },
      // タイトルのアニメーション
      animation: {
        'fade-in-down': 'fade-in-down 0.5s ease-out'
      },
      keyframes: {
        'fade-in-down': {
          '0%': {
            opacity: '0',
            transform: 'translateY(-10px)'
          },
          '100%': {
            opacity: '1',
            transform: 'translateY(0)'
          },
        }
      },
    },
  },
  variants: {},
  plugins: [
    function({ addUtilities, theme }) {
      const newUtilities = {}
      const delays = [100, 200, 300, 400, 500, 600, 700]
      delays.forEach(delay => {
        newUtilities[`.animation-delay-${delay}`] = {
          'animation-delay': `${delay}ms`,
        }
      })
      addUtilities(newUtilities)
    }
  ]
}
