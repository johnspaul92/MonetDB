/* -*- c-basic-offset:4; c-indentation-style:"k&r"; indent-tabs-mode:nil -*- */

/**
 * @file
 *
 * Functions and data structures to support environments for various
 * Pathfinder modules.
 *
 *
 * Copyright Notice:
 * -----------------
 *
 *  The contents of this file are subject to the MonetDB Public
 *  License Version 1.0 (the "License"); you may not use this file
 *  except in compliance with the License. You may obtain a copy of
 *  the License at http://monetdb.cwi.nl/Legal/MonetDBLicense-1.0.html
 *
 *  Software distributed under the License is distributed on an "AS
 *  IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
 *  implied. See the License for the specific language governing
 *  rights and limitations under the License.
 *
 *  The Original Code is the ``Pathfinder'' system. The Initial
 *  Developer of the Original Code is the Database & Information
 *  Systems Group at the University of Konstanz, Germany. Portions
 *  created by U Konstanz are Copyright (C) 2000-2004 University
 *  of Konstanz. All Rights Reserved.
 *
 *  Contributors:
 *          Torsten Grust <torsten.grust@uni-konstanz.de>
 *          Maurice van Keulen <M.van.Keulen@bigfoot.com>
 *          Jens Teubner <jens.teubner@uni-konstanz.de>
 *
 * $Id$
 */

#ifndef ENV_H
#define ENV_H

/* PFqname_t */
#include "qname.h"

/* PFarray_t */
#include "array.h"

typedef PFarray_t PFenv_t;

/* create a new environment */
PFenv_t *PFenv (void);

/* bind key to value in environment 
 * (return 0 if key was unbound, value otherwise) 
 */
PFarray_t *PFenv_bind (PFenv_t *, PFqname_t, void *);

/* lookup given key in environment (returns array of bindings or 0) */
PFarray_t *PFenv_lookup (PFenv_t *, PFqname_t);

/** iterate over all bound values in an environment */
void PFenv_iterate (PFenv_t *, void (*) (void *));

/** iterate over all bound keys in an environment */
void PFenv_key_iterate (PFenv_t *, void (*) (PFqname_t));

/* number of keys in environment */
unsigned int PFenv_count (PFenv_t *);

#endif /* ENV_H */


/* vim:set shiftwidth=4 expandtab: */
