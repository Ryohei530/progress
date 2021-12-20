const path = require('path')
const glob = require('glob')
const webpack = require('webpack')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const VueLoaderPlugin = require('vue-loader/lib/plugin')
const ManifestPlugin = require('webpack-manifest-plugin')

let entries = {}
glob.sync('./frontend/pages/**/*.js').map(function (file) {
    let name = file.split('/')[4].split('.')[0]
    entries[name] = file
})

module.exports = (env, argv) => {
    const IS_DEV = argv.mode === 'development'

    return {
        entry: entries,
        // devtool: IS_DEV ? 'source-map' : 'none',  // HMRが重くなる原因なので外した方がいい。
        output: {
            filename: 'javascripts/bundle/[name]-[hash].js',
            path: path.resolve(__dirname, './frontend/public/assets')
        },
        plugins: [
            new VueLoaderPlugin(),
            new MiniCssExtractPlugin({
                filename: 'stylesheets/bundle/[name]-[hash].css'
            }),
            new webpack.HotModuleReplacementPlugin(),
            new ManifestPlugin({
                writeToFileEmit: true
            })
        ],
        module: {
            rules: [{
                    test: /\.js$/,
                    exclude: /node_modules/,
                    loader: 'babel-loader',
                    options: {
                        presets: ['@babel/preset-env'],
                        plugins: ["@babel/plugin-transform-runtime"]
                    }
                },
                {
                    test: /\.vue$/,
                    loader: 'vue-loader'
                },
                {
                    test: /\.sass$/,
                    use: [
                        'vue-style-loader',
                        {
                            loader: 'css-loader',
                            options: {
                                url: false,
                                sourceMap: true,
                                importLoaders: 2
                            }
                        },
                        {
                            loader: 'sass-loader',
                            options: {
                                implementation: require('sass'),
                                sassOptions: {
                                    fiber: require('fibers'),
                                    indentedSyntax: true
                                },
                            },
                        }
                    ]
                },
                {
                    test: /\.pug/,
                    loader: 'pug-plain-loader'
                },
                {
                    test: /\.(c|sc)ss$/,
                    use: [{
                            loader: MiniCssExtractPlugin.loader,
                            options: {
                                publicPath: path.resolve(
                                    __dirname,
                                    './frontend/public/assets/stylesheets/bundle'
                                ),
                                url: false
                            }
                        },
                        {
                            loader: 'css-loader',
                            options: {
                                url: false,
                                sourceMap: true,
                                importLoaders: 2
                            }
                        },
                        'sass-loader'
                    ]
                },
                {
                    test: /\.(jpg|png|gif)$/,
                    loader: 'file-loader',
                    options: {
                        name: '[name]-[hash].[ext]',
                        outputPath: 'images/bundle',
                        publicPath: function (path) {
                            return 'images/bundle/' + path
                        }
                    }
                }
            ]
        },
        resolve: {
            alias: {
                vue: 'vue/dist/vue.js'
            },
            extensions: ['.js', '.scss', 'css', '.vue', '.jpg', '.png', '.gif']
        },
        optimization: {
            splitChunks: {
                cacheGroups: {
                    vendor: {
                        test: /.(c|sa)ss/,
                        name: 'style',
                        chunks: 'all',
                        enforce: true
                    }
                }
            }
        },
        devServer: {
            host: 'localhost',
            port: 3035,
            publicPath: 'http://localhost:3035/frontend/public/assets',
            public: "9622943d6ddd4db6a1aec8991d298951.vfs.cloud9.ap-northeast-1.amazonaws.com:3035",
            contentBase: path.resolve(__dirname, './frontend/public/assets'),
            hot: true,
            // disableHostCheck: true,
            historyApiFallback: true
        }
    }
}