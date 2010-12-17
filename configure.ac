#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ(2.59)
AC_INIT(LIBSVM-Plus, 2.90, nemo@neminis.org)
AM_INIT_AUTOMAKE([dist-bzip2 foreign])
AC_PROG_LIBTOOL
AC_CONFIG_FILES([Makefile])
AC_CONFIG_SRCDIR([svm.cpp])

AC_PROG_CXXCPP
AC_PROG_CXX
AC_PROG_CPP

AC_LANG([C++])

AC_HEADER_STDC
AC_CHECK_HEADERS([float.h math.h stdio.h ctype.h stdlib.h string.h errno.h])
AC_FUNC_MALLOC

AC_SUBST([AM_CXXFLAGS])
AC_SUBST([AM_LDFLAGS])

LIBSVM_SHARED_LIB_VERSION="1:0:0"
AC_SUBST(LIBSVM_SHARED_LIB_VERSION)

AC_OUTPUT

