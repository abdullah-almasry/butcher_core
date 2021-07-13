/// Support for doing something awesome.
///
/// More dartdocs go here.
library butcher_core;

/// ? utils
export 'dart:developer' hide Flow;
export 'dart:io';

/// ? other packages
export 'package:equatable/equatable.dart';
export 'package:easy_localization/easy_localization.dart' hide TextDirection;
export 'package:butcher_core/src/core/blocs/cubit/core_cubit_cubit.dart';
export 'package:queen_validators/queen_validators.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:textless/textless.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:butcher_core/src/core/controller/controller.dart';
export 'package:butcher_core/src/core/app/q_app.dart';
export 'package:butcher_core/src/core/utils/logger.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:font_awesome_flutter/font_awesome_flutter.dart';
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:flutter_svg/flutter_svg.dart';

/// * models
export 'src/models/category.dart';
export 'src/models/user.dart';
export 'src/models/slider.dart';
export 'src/models/lang_atr.dart';
export 'src/models/prod.dart';
export 'src/models/prod_opt.dart';
export 'src/models/prod_opt_value.dart';
export 'src/models/cart_item.dart';
export 'src/models/cart_item_option.dart';
export 'src/models/payment.dart';
export 'src/models/user.dart';
export 'src/models/place_model.dart';
export 'src/models/tlabaty.dart';

/// * services
export 'src/services/auth.dart';
export 'src/services/categories.dart';
export 'src/services/sliders.dart';
export 'src/services/products.dart';
export 'src/services/payment.dart';
export 'src/services/places.dart';
export 'src/services/tlpaty.dart';

/// * cubits [state_managment]
export 'src/cubits/auth_cubit/authantication_bloc.dart';
export 'src/cubits/sign_in/sign_in_cubit.dart';

/// * brand
export 'src/brand/assets.dart';
export 'src/brand/colors.dart';
export 'src/brand/theme.dart';

/// * pages
export 'src/pages/splash.dart';

/// * widgets
export 'src/widgets/center_loading.dart';
export 'src/widgets/center_error.dart';

/// * utils
export 'src/utils/add_to_cart_helper.dart';

/// * mixer


/// * enums
export 'src/comman/enums.dart';