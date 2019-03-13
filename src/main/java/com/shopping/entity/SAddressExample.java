package com.shopping.entity;

import java.util.ArrayList;
import java.util.List;

public class SAddressExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SAddressExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andAddreessidIsNull() {
            addCriterion("addreessid is null");
            return (Criteria) this;
        }

        public Criteria andAddreessidIsNotNull() {
            addCriterion("addreessid is not null");
            return (Criteria) this;
        }

        public Criteria andAddreessidEqualTo(Integer value) {
            addCriterion("addreessid =", value, "addreessid");
            return (Criteria) this;
        }

        public Criteria andAddreessidNotEqualTo(Integer value) {
            addCriterion("addreessid <>", value, "addreessid");
            return (Criteria) this;
        }

        public Criteria andAddreessidGreaterThan(Integer value) {
            addCriterion("addreessid >", value, "addreessid");
            return (Criteria) this;
        }

        public Criteria andAddreessidGreaterThanOrEqualTo(Integer value) {
            addCriterion("addreessid >=", value, "addreessid");
            return (Criteria) this;
        }

        public Criteria andAddreessidLessThan(Integer value) {
            addCriterion("addreessid <", value, "addreessid");
            return (Criteria) this;
        }

        public Criteria andAddreessidLessThanOrEqualTo(Integer value) {
            addCriterion("addreessid <=", value, "addreessid");
            return (Criteria) this;
        }

        public Criteria andAddreessidIn(List<Integer> values) {
            addCriterion("addreessid in", values, "addreessid");
            return (Criteria) this;
        }

        public Criteria andAddreessidNotIn(List<Integer> values) {
            addCriterion("addreessid not in", values, "addreessid");
            return (Criteria) this;
        }

        public Criteria andAddreessidBetween(Integer value1, Integer value2) {
            addCriterion("addreessid between", value1, value2, "addreessid");
            return (Criteria) this;
        }

        public Criteria andAddreessidNotBetween(Integer value1, Integer value2) {
            addCriterion("addreessid not between", value1, value2, "addreessid");
            return (Criteria) this;
        }

        public Criteria andUseridIsNull() {
            addCriterion("userid is null");
            return (Criteria) this;
        }

        public Criteria andUseridIsNotNull() {
            addCriterion("userid is not null");
            return (Criteria) this;
        }

        public Criteria andUseridEqualTo(Integer value) {
            addCriterion("userid =", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotEqualTo(Integer value) {
            addCriterion("userid <>", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThan(Integer value) {
            addCriterion("userid >", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThanOrEqualTo(Integer value) {
            addCriterion("userid >=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThan(Integer value) {
            addCriterion("userid <", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThanOrEqualTo(Integer value) {
            addCriterion("userid <=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridIn(List<Integer> values) {
            addCriterion("userid in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotIn(List<Integer> values) {
            addCriterion("userid not in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridBetween(Integer value1, Integer value2) {
            addCriterion("userid between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotBetween(Integer value1, Integer value2) {
            addCriterion("userid not between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andConsigneeIsNull() {
            addCriterion("consignee is null");
            return (Criteria) this;
        }

        public Criteria andConsigneeIsNotNull() {
            addCriterion("consignee is not null");
            return (Criteria) this;
        }

        public Criteria andConsigneeEqualTo(String value) {
            addCriterion("consignee =", value, "consignee");
            return (Criteria) this;
        }

        public Criteria andConsigneeNotEqualTo(String value) {
            addCriterion("consignee <>", value, "consignee");
            return (Criteria) this;
        }

        public Criteria andConsigneeGreaterThan(String value) {
            addCriterion("consignee >", value, "consignee");
            return (Criteria) this;
        }

        public Criteria andConsigneeGreaterThanOrEqualTo(String value) {
            addCriterion("consignee >=", value, "consignee");
            return (Criteria) this;
        }

        public Criteria andConsigneeLessThan(String value) {
            addCriterion("consignee <", value, "consignee");
            return (Criteria) this;
        }

        public Criteria andConsigneeLessThanOrEqualTo(String value) {
            addCriterion("consignee <=", value, "consignee");
            return (Criteria) this;
        }

        public Criteria andConsigneeLike(String value) {
            addCriterion("consignee like", value, "consignee");
            return (Criteria) this;
        }

        public Criteria andConsigneeNotLike(String value) {
            addCriterion("consignee not like", value, "consignee");
            return (Criteria) this;
        }

        public Criteria andConsigneeIn(List<String> values) {
            addCriterion("consignee in", values, "consignee");
            return (Criteria) this;
        }

        public Criteria andConsigneeNotIn(List<String> values) {
            addCriterion("consignee not in", values, "consignee");
            return (Criteria) this;
        }

        public Criteria andConsigneeBetween(String value1, String value2) {
            addCriterion("consignee between", value1, value2, "consignee");
            return (Criteria) this;
        }

        public Criteria andConsigneeNotBetween(String value1, String value2) {
            addCriterion("consignee not between", value1, value2, "consignee");
            return (Criteria) this;
        }

        public Criteria andAddressnameIsNull() {
            addCriterion("addressname is null");
            return (Criteria) this;
        }

        public Criteria andAddressnameIsNotNull() {
            addCriterion("addressname is not null");
            return (Criteria) this;
        }

        public Criteria andAddressnameEqualTo(String value) {
            addCriterion("addressname =", value, "addressname");
            return (Criteria) this;
        }

        public Criteria andAddressnameNotEqualTo(String value) {
            addCriterion("addressname <>", value, "addressname");
            return (Criteria) this;
        }

        public Criteria andAddressnameGreaterThan(String value) {
            addCriterion("addressname >", value, "addressname");
            return (Criteria) this;
        }

        public Criteria andAddressnameGreaterThanOrEqualTo(String value) {
            addCriterion("addressname >=", value, "addressname");
            return (Criteria) this;
        }

        public Criteria andAddressnameLessThan(String value) {
            addCriterion("addressname <", value, "addressname");
            return (Criteria) this;
        }

        public Criteria andAddressnameLessThanOrEqualTo(String value) {
            addCriterion("addressname <=", value, "addressname");
            return (Criteria) this;
        }

        public Criteria andAddressnameLike(String value) {
            addCriterion("addressname like", value, "addressname");
            return (Criteria) this;
        }

        public Criteria andAddressnameNotLike(String value) {
            addCriterion("addressname not like", value, "addressname");
            return (Criteria) this;
        }

        public Criteria andAddressnameIn(List<String> values) {
            addCriterion("addressname in", values, "addressname");
            return (Criteria) this;
        }

        public Criteria andAddressnameNotIn(List<String> values) {
            addCriterion("addressname not in", values, "addressname");
            return (Criteria) this;
        }

        public Criteria andAddressnameBetween(String value1, String value2) {
            addCriterion("addressname between", value1, value2, "addressname");
            return (Criteria) this;
        }

        public Criteria andAddressnameNotBetween(String value1, String value2) {
            addCriterion("addressname not between", value1, value2, "addressname");
            return (Criteria) this;
        }

        public Criteria andAddressphoneIsNull() {
            addCriterion("addressphone is null");
            return (Criteria) this;
        }

        public Criteria andAddressphoneIsNotNull() {
            addCriterion("addressphone is not null");
            return (Criteria) this;
        }

        public Criteria andAddressphoneEqualTo(String value) {
            addCriterion("addressphone =", value, "addressphone");
            return (Criteria) this;
        }

        public Criteria andAddressphoneNotEqualTo(String value) {
            addCriterion("addressphone <>", value, "addressphone");
            return (Criteria) this;
        }

        public Criteria andAddressphoneGreaterThan(String value) {
            addCriterion("addressphone >", value, "addressphone");
            return (Criteria) this;
        }

        public Criteria andAddressphoneGreaterThanOrEqualTo(String value) {
            addCriterion("addressphone >=", value, "addressphone");
            return (Criteria) this;
        }

        public Criteria andAddressphoneLessThan(String value) {
            addCriterion("addressphone <", value, "addressphone");
            return (Criteria) this;
        }

        public Criteria andAddressphoneLessThanOrEqualTo(String value) {
            addCriterion("addressphone <=", value, "addressphone");
            return (Criteria) this;
        }

        public Criteria andAddressphoneLike(String value) {
            addCriterion("addressphone like", value, "addressphone");
            return (Criteria) this;
        }

        public Criteria andAddressphoneNotLike(String value) {
            addCriterion("addressphone not like", value, "addressphone");
            return (Criteria) this;
        }

        public Criteria andAddressphoneIn(List<String> values) {
            addCriterion("addressphone in", values, "addressphone");
            return (Criteria) this;
        }

        public Criteria andAddressphoneNotIn(List<String> values) {
            addCriterion("addressphone not in", values, "addressphone");
            return (Criteria) this;
        }

        public Criteria andAddressphoneBetween(String value1, String value2) {
            addCriterion("addressphone between", value1, value2, "addressphone");
            return (Criteria) this;
        }

        public Criteria andAddressphoneNotBetween(String value1, String value2) {
            addCriterion("addressphone not between", value1, value2, "addressphone");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Integer value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Integer value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Integer value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Integer value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Integer value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Integer> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Integer> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Integer value1, Integer value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}