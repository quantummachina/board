# Bootstrap Generators

Bootstrap-generators provides [Twitter Bootstrap](http://twitter.github.com/bootstrap/) generators for Rails 3.1. Bootstrap is a toolkit from Twitter designed to kickstart development of webapps and sites. Checkout http://decioferreira.github.com/bootstrap-generators.

## Installing Gem

In your Gemfile, add this line:

    gem 'bootstrap-generators', '~> 2.0'

Or you can install from latest build:

    gem 'bootstrap-generators', '~> 2.0', :git => 'git://github.com/decioferreira/bootstrap-generators.git'

By default Bootstrap Generators requires [SimpleForm 2.0](https://github.com/plataformatec/simple_form). Add the dependency on your Gemfile:

    gem 'simple_form', '~> 2.0'

If you don't want to use SimpleForm, just pass the `--form_builder=form_builder` option:

    rails generate bootstrap:install --form_builder=form_builder

Run bundle install:

    bundle install

## Generators

Get started:

    rails generate bootstrap:install

Once you've done that, any time you generate a controller or scaffold, you'll get [Bootstrap](http://twitter.github.com/bootstrap/) templates.

### Give it a try

    rails generate scaffold post title:string body:text published:boolean

You can easily [customize colors, grid system, fonts, and much more](http://decioferreira.github.com/bootstrap-generators) with Bootstrap-generators and LESS or SCSS. Visit http://decioferreira.github.com/bootstrap-generators.

## Usage

To print the options and usage run the command `rails generate bootstrap:install --help`

    rails generate bootstrap:install [options]

    Options:
          [--layout=LAYOUT]                         # Bootstrap layout templates (hero or fluid)
                                                    # Default: hero
          [--form-builder=FORM_BUILDER]             # Select your form builder (simple_form or form_builder)
                                                    # Default: simple_form
      -e, [--template-engine=TEMPLATE_ENGINE]       # Indicates when to generate template engine
                                                    # Default: erb
      -se, [--stylesheet-engine=STYLESHEET_ENGINE]  # Indicates when to generate stylesheet engine
                                                    # Default: scss

    Runtime options:
      -f, [--force]    # Overwrite files that already exist
      -p, [--pretend]  # Run but do not make any changes
      -q, [--quiet]    # Supress status output
      -s, [--skip]     # Skip files that already exist

    Copy BootstrapGenerators default files

### Options

#### Layouts

There are the two available layouts, based on Bootstrap's quick-start examples:

* [Basic marketing site](http://twitter.github.com/bootstrap/examples/hero.html) (default)
* [Fluid layout](http://twitter.github.com/bootstrap/examples/fluid.html)

To select one of these layouts just pass the option `--layout=LAYOUT` to the install generator.

#### Form builders

* SimpleForm

By default Bootstrap Generators requires SimpleForm 2.0. Add the dependency on your Gemfile:

    gem 'simple_form', '~> 2.0'

And then run:

    rails generate bootstrap:install --form_builder=simple_form

* Default Rails form builder

If you don't want to use SimpleForm, just pass the `--form_builder=form_builder` option:

    rails generate bootstrap:install --form_builder=form_builder

#### Template engines

Supported template engines:

* ERB
* Haml

Add the dependency on your Gemfile:

    gem 'haml-rails'

And then run:

    rails generate bootstrap:install --template-engine=haml

#### Stylesheet engines

Supported stylesheet engines:

* CSS
* SCSS
* LESS

Make sure you have `sass-rails` dependency on your Gemfile:

    gem 'sass-rails'

And then run:

    rails generate bootstrap:install --stylesheet-engine=scss

Now you can [customize](http://decioferreira.github.com/bootstrap-generators/) the look and feel of Bootstrap.

* LESS

Add the dependency on your Gemfile:

    gem 'less-rails'

And then run:

    rails generate bootstrap:install --stylesheet-engine=less

Now you can [customize](http://decioferreira.github.com/bootstrap-generators/) the look and feel of Bootstrap.

## Assets

<a name="customize"></a>

### Customize and extend Bootstrap

If you select LESS or SCSS as your stylesheet engine, you will get an `app/assets/stylesheets/bootstrap-variables.[less|css.scss]` file with all of the [default variables](http://twitter.github.com/bootstrap/less.html#variables) of Bootstrap. This way you can [customize](http://decioferreira.github.com/bootstrap-generators/) the look and feel of Bootstrap without having to download any extra file:

LESS version:

    // Variables.less
    // Variables to customize the look and feel of Bootstrap
    // -----------------------------------------------------



    // GLOBAL VALUES
    // --------------------------------------------------


    // Grays
    // -------------------------
    @black:                 #000;
    @grayDarker:            #222;
    @grayDark:              #333;
    @gray:                  #555;
    @grayLight:             #999;
    @grayLighter:           #eee;
    @white:                 #fff;


    // Accent colors
    // -------------------------
    @blue:                  #049cdb;
    @blueDark:              #0064cd;
    @green:                 #46a546;
    @red:                   #9d261d;
    @yellow:                #ffc40d;
    @orange:                #f89406;
    @pink:                  #c3325f;
    @purple:                #7a43b6;


    // Scaffolding
    // -------------------------
    @bodyBackground:        @white;
    @textColor:             @grayDark;


    // Links
    // -------------------------
    @linkColor:             #08c;
    @linkColorHover:        darken(@linkColor, 15%);


    // Typography
    // -------------------------
    @sansFontFamily:        "Helvetica Neue", Helvetica, Arial, sans-serif;
    @serifFontFamily:       Georgia, "Times New Roman", Times, serif;
    @monoFontFamily:        Menlo, Monaco, Consolas, "Courier New", monospace;

    @baseFontSize:          13px;
    @baseFontFamily:        @sansFontFamily;
    @baseLineHeight:        18px;
    @altFontFamily:         @serifFontFamily;

    @headingsFontFamily:    inherit; // empty to use BS default, @baseFontFamily
    @headingsFontWeight:    bold;    // instead of browser default, bold
    @headingsColor:         inherit; // empty to use BS default, @textColor


    // Tables
    // -------------------------
    @tableBackground:                   transparent; // overall background-color
    @tableBackgroundAccent:             #f9f9f9; // for striping
    @tableBackgroundHover:              #f5f5f5; // for hover
    @tableBorder:                       #ddd; // table and cell border


    // Buttons
    // -------------------------
    @btnBackground:                     @white;
    @btnBackgroundHighlight:            darken(@white, 10%);
    @btnBorder:                         #ccc;

    @btnPrimaryBackground:              @linkColor;
    @btnPrimaryBackgroundHighlight:     spin(@btnPrimaryBackground, 15%);

    @btnInfoBackground:                 #5bc0de;
    @btnInfoBackgroundHighlight:        #2f96b4;

    @btnSuccessBackground:              #62c462;
    @btnSuccessBackgroundHighlight:     #51a351;

    @btnWarningBackground:              lighten(@orange, 15%);
    @btnWarningBackgroundHighlight:     @orange;

    @btnDangerBackground:               #ee5f5b;
    @btnDangerBackgroundHighlight:      #bd362f;

    @btnInverseBackground:              @gray;
    @btnInverseBackgroundHighlight:     @grayDarker;


    // Forms
    // -------------------------
    @inputBackground:               @white;
    @inputBorder:                   #ccc;
    @inputBorderRadius:             3px;
    @inputDisabledBackground:       @grayLighter;
    @formActionsBackground:         #f5f5f5;

    // Dropdowns
    // -------------------------
    @dropdownBackground:            @white;
    @dropdownBorder:                rgba(0,0,0,.2);
    @dropdownLinkColor:             @grayDark;
    @dropdownLinkColorHover:        @white;
    @dropdownLinkBackgroundHover:   @linkColor;
    @dropdownDividerTop:            #e5e5e5;
    @dropdownDividerBottom:         @white;



    // COMPONENT VARIABLES
    // --------------------------------------------------

    // Z-index master list
    // -------------------------
    // Used for a bird's eye view of components dependent on the z-axis
    // Try to avoid customizing these :)
    @zindexDropdown:          1000;
    @zindexPopover:           1010;
    @zindexTooltip:           1020;
    @zindexFixedNavbar:       1030;
    @zindexModalBackdrop:     1040;
    @zindexModal:             1050;


    // Sprite icons path
    // -------------------------
    @iconSpritePath:          "glyphicons-halflings.png";
    @iconWhiteSpritePath:     "glyphicons-halflings-white.png";


    // Input placeholder text color
    // -------------------------
    @placeholderText:         @grayLight;


    // Hr border color
    // -------------------------
    @hrBorder:                @grayLighter;


    // Navbar
    // -------------------------
    @navbarHeight:                    40px;
    @navbarBackground:                @grayDarker;
    @navbarBackgroundHighlight:       @grayDark;

    @navbarText:                      @grayLight;
    @navbarLinkColor:                 @grayLight;
    @navbarLinkColorHover:            @white;
    @navbarLinkColorActive:           @navbarLinkColorHover;
    @navbarLinkBackgroundHover:       transparent;
    @navbarLinkBackgroundActive:      @navbarBackground;

    @navbarSearchBackground:          lighten(@navbarBackground, 25%);
    @navbarSearchBackgroundFocus:     @white;
    @navbarSearchBorder:              darken(@navbarSearchBackground, 30%);
    @navbarSearchPlaceholderColor:    #ccc;
    @navbarBrandColor:                @navbarLinkColor;


    // Hero unit
    // -------------------------
    @heroUnitBackground:              @grayLighter;
    @heroUnitHeadingColor:            inherit;
    @heroUnitLeadColor:               inherit;


    // Form states and alerts
    // -------------------------
    @warningText:             #c09853;
    @warningBackground:       #fcf8e3;
    @warningBorder:           darken(spin(@warningBackground, -10), 3%);

    @errorText:               #b94a48;
    @errorBackground:         #f2dede;
    @errorBorder:             darken(spin(@errorBackground, -10), 3%);

    @successText:             #468847;
    @successBackground:       #dff0d8;
    @successBorder:           darken(spin(@successBackground, -10), 5%);

    @infoText:                #3a87ad;
    @infoBackground:          #d9edf7;
    @infoBorder:              darken(spin(@infoBackground, -10), 7%);



    // GRID
    // --------------------------------------------------

    // Default 940px grid
    // -------------------------
    @gridColumns:             12;
    @gridColumnWidth:         60px;
    @gridGutterWidth:         20px;
    @gridRowWidth:            (@gridColumns * @gridColumnWidth) + (@gridGutterWidth * (@gridColumns - 1));

    // Fluid grid
    // -------------------------
    @fluidGridColumnWidth:    6.382978723%;
    @fluidGridGutterWidth:    2.127659574%;

SCSS version:

    // Variables
    // Variables to customize the look and feel of Bootstrap
    // -----------------------------------------------------



    // GLOBAL VALUES
    // --------------------------------------------------


    // Grays
    // -------------------------
    $black:                 #000 !default;
    $grayDarker:            #222 !default;
    $grayDark:              #333 !default;
    $gray:                  #555 !default;
    $grayLight:             #999 !default;
    $grayLighter:           #eee !default;
    $white:                 #fff !default;


    // Accent colors
    // -------------------------
    $blue:                  #049cdb !default;
    $blueDark:              #0064cd !default;
    $green:                 #46a546 !default;
    $red:                   #9d261d !default;
    $yellow:                #ffc40d !default;
    $orange:                #f89406 !default;
    $pink:                  #c3325f !default;
    $purple:                #7a43b6 !default;


    // Scaffolding
    // -------------------------
    $bodyBackground:        $white !default;
    $textColor:             $grayDark !default;


    // Links
    // -------------------------
    $linkColor:             #08c !default;
    $linkColorHover:        darken($linkColor, 15%) !default;


    // Typography
    // -------------------------
    $sansFontFamily:        "Helvetica Neue", Helvetica, Arial, sans-serif !default;
    $serifFontFamily:       Georgia, "Times New Roman", Times, serif !default;
    $monoFontFamily:        Menlo, Monaco, Consolas, "Courier New", monospace !default;

    $baseFontSize:          13px !default;
    $baseFontFamily:        $sansFontFamily !default;
    $baseLineHeight:        18px !default;
    $altFontFamily:         $serifFontFamily !default;

    $headingsFontFamily:    inherit !default; // empty to use BS default, $baseFontFamily
    $headingsFontWeight:    bold !default;    // instead of browser default, bold
    $headingsColor:         inherit !default; // empty to use BS default, $textColor


    // Tables
    // -------------------------
    $tableBackground:                   transparent !default; // overall background-color
    $tableBackgroundAccent:             #f9f9f9 !default; // for striping
    $tableBackgroundHover:              #f5f5f5 !default; // for hover
    $tableBorder:                       #ddd !default; // table and cell border


    // Buttons
    // -------------------------
    $btnBackground:                     $white !default;
    $btnBackgroundHighlight:            darken($white, 10%) !default;
    $btnBorder:                         #ccc !default;

    $btnPrimaryBackground:              $linkColor !default;
    $btnPrimaryBackgroundHighlight:     adjust-hue($btnPrimaryBackground, 15%) !default;

    $btnInfoBackground:                 #5bc0de !default;
    $btnInfoBackgroundHighlight:        #2f96b4 !default;

    $btnSuccessBackground:              #62c462 !default;
    $btnSuccessBackgroundHighlight:     #51a351 !default;

    $btnWarningBackground:              lighten($orange, 15%) !default;
    $btnWarningBackgroundHighlight:     $orange !default;

    $btnDangerBackground:               #ee5f5b !default;
    $btnDangerBackgroundHighlight:      #bd362f !default;

    $btnInverseBackground:              $gray !default;
    $btnInverseBackgroundHighlight:     $grayDarker !default;


    // Forms
    // -------------------------
    $inputBackground:               $white !default;
    $inputBorder:                   #ccc !default;
    $inputBorderRadius:             3px !default;
    $inputDisabledBackground:       $grayLighter !default;
    $formActionsBackground:         #f5f5f5 !default;

    // Dropdowns
    // -------------------------
    $dropdownBackground:            $white !default;
    $dropdownBorder:                rgba(0,0,0,.2) !default;
    $dropdownLinkColor:             $grayDark !default;
    $dropdownLinkColorHover:        $white !default;
    $dropdownLinkBackgroundHover:   $linkColor !default;



    // COMPONENT VARIABLES
    // --------------------------------------------------

    // Z-index master list
    // -------------------------
    // Used for a bird's eye view of components dependent on the z-axis
    // Try to avoid customizing these :)
    $zindexDropdown:          1000 !default;
    $zindexPopover:           1010 !default;
    $zindexTooltip:           1020 !default;
    $zindexFixedNavbar:       1030 !default;
    $zindexModalBackdrop:     1040 !default;
    $zindexModal:             1050 !default;


    // Sprite icons path
    // -------------------------
    $iconSpritePath:          "glyphicons-halflings.png" !default;
    $iconWhiteSpritePath:     "glyphicons-halflings-white.png" !default;


    // Input placeholder text color
    // -------------------------
    $placeholderText:         $grayLight !default;


    // Hr border color
    // -------------------------
    $hrBorder:                $grayLighter !default;


    // Navbar
    // -------------------------
    $navbarHeight:                    40px !default;
    $navbarBackground:                $grayDarker !default;
    $navbarBackgroundHighlight:       $grayDark !default;

    $navbarText:                      $grayLight !default;
    $navbarLinkColor:                 $grayLight !default;
    $navbarLinkColorHover:            $white !default;
    $navbarLinkColorActive:           $navbarLinkColorHover !default;
    $navbarLinkBackgroundHover:       transparent !default;
    $navbarLinkBackgroundActive:      $navbarBackground !default;

    $navbarSearchBackground:          lighten($navbarBackground, 25%) !default;
    $navbarSearchBackgroundFocus:     $white !default;
    $navbarSearchBorder:              darken($navbarSearchBackground, 30%) !default;
    $navbarSearchPlaceholderColor:    #ccc !default;
    $navbarBrandColor:                $navbarLinkColor !default;


    // Hero unit
    // -------------------------
    $heroUnitBackground:              $grayLighter !default;
    $heroUnitHeadingColor:            inherit !default;
    $heroUnitLeadColor:               inherit !default;


    // Form states and alerts
    // -------------------------
    $warningText:             #c09853 !default;
    $warningBackground:       #fcf8e3 !default;
    $warningBorder:           darken(adjust-hue($warningBackground, -10), 3%) !default;

    $errorText:               #b94a48 !default;
    $errorBackground:         #f2dede !default;
    $errorBorder:             darken(adjust-hue($errorBackground, -10), 3%) !default;

    $successText:             #468847 !default;
    $successBackground:       #dff0d8 !default;
    $successBorder:           darken(adjust-hue($successBackground, -10), 5%) !default;

    $infoText:                #3a87ad !default;
    $infoBackground:          #d9edf7 !default;
    $infoBorder:              darken(adjust-hue($infoBackground, -10), 7%) !default;



    // GRID
    // --------------------------------------------------

    // Default 940px grid
    // -------------------------
    $gridColumns:             12 !default;
    $gridColumnWidth:         60px !default;
    $gridGutterWidth:         20px !default;
    $gridRowWidth:            ($gridColumns * $gridColumnWidth) + ($gridGutterWidth * ($gridColumns - 1)) !default;

    // Fluid grid
    // -------------------------
    $fluidGridColumnWidth:    6.382978723% !default;
    $fluidGridGutterWidth:    2.127659574% !default;

### Javascript

Select all jQuery plugins (`app/assets/javascripts/bootstrap.js`)

    //= require bootstrap

Or quickly add only the necessary javascript (Transitions: required for any animation; Popovers: requires Tooltips)

    //= require bootstrap-transition
    //= require bootstrap-alert
    //= require bootstrap-modal
    //= require bootstrap-dropdown
    //= require bootstrap-scrollspy
    //= require bootstrap-tab
    //= require bootstrap-tooltip
    //= require bootstrap-popover
    //= require bootstrap-button
    //= require bootstrap-collapse
    //= require bootstrap-carousel
    //= require bootstrap-typeahead

## Customizing Templates

In Rails 3.0 and above, generators don’t just look in the source root for templates, they also search for templates in other paths. And one of them is lib/templates.

Since Bootstrap Generators installs its templates under lib/templates, you can go and customize them.

## Credits

* [Twitter Bootstrap](http://twitter.github.com/bootstrap)
* [Twitter Bootstrap - Sass Conversion](https://github.com/jlong/sass-twitter-bootstrap)
* [SimpleForm](https://github.com/plataformatec/simple_form)

[customize]: #customize
